#include <bigloo.h>
#include <strings.h>
#include "Clib/caml-bigloo.h"
#include "Clib/value-bigloo.h"
#include "Clib/io.h"
#include "Clib/fail.h"

/*---------------------------------------------------------------------*/
/*    struct channel *                                                 */
/*    open_descriptor ...                                              */
/*---------------------------------------------------------------------*/
struct channel *
open_descriptor( fd )
value fd;
{
	struct channel *channel;

   channel         = (struct channel *) stat_alloc( sizeof( struct channel ) );
	
   channel->fd     = Long_of_val( fd );
   channel->offset = 0;
   channel->curr   = channel->max = channel->buff;
   channel->end    = channel->buff + IO_BUFFER_SIZE;
	
   return channel;
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    channel_descriptor ...                                           */
/*---------------------------------------------------------------------*/
value
channel_descriptor( channel )
struct channel *channel;
{
	return Val_of_long( channel->fd );
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    channel_size ...                                                 */
/*---------------------------------------------------------------------*/
value
channel_size( channel )
struct channel *channel;
{
	long end;

	end = lseek( channel->fd, 0, 2 );
	
	if( end == -1 )
	   sys_error();

	if( lseek( channel->fd, channel->offset, 0 ) != channel->offset )
	   sys_error();
	
	return Val_of_long( end );
}
 
/*---------------------------------------------------------------------*/
/*    static void                                                      */
/*    really_write ...                                                 */
/*---------------------------------------------------------------------*/
static void
really_write( fd, p, n )
int   fd;
char *p;
int   n;
{
	int retcode;
	
	while( n > 0 )
	{
		retcode = write( fd, p, n );
		
		if (retcode == -1)
		   sys_error();
		
		p += retcode;
		n -= retcode;
	}
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    flush ...                                                        */
/*---------------------------------------------------------------------*/
value
flush( channel )
struct channel *channel;
{
	int n;

	n = channel->max - channel->buff;

	if( n > 0 )
	{
		really_write( channel->fd, channel->buff, n );

		channel->offset += n;
		channel->curr    = channel->buff;
		channel->max     = channel->buff;
	}

	return Atom( 0 );
}
		
/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    output_char ...                                                  */
/*---------------------------------------------------------------------*/
value
output_char( channel, ch )
struct channel *channel;
value           ch;
{
	putch( channel, CCHAR( ch ) );
	
	return Atom( 0 );
}

/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    putword ...                                                      */
/*---------------------------------------------------------------------*/
void
putword( channel, w )
struct channel *channel;
long w;
{
	putch( channel, w >> 24 );
	putch( channel, w >> 16 );
	putch( channel, w >> 8 );
	putch( channel, w );
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    output_int ...                                                   */
/*---------------------------------------------------------------------*/
value
output_int( channel, w )
struct channel *channel;
value w;
{
	putword( channel, Long_of_val( w ) );

	return Atom( 0 );
}

/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    putblock ...                                                     */
/*---------------------------------------------------------------------*/
void
putblock( channel, p, n )
struct channel *channel;
char           *p;
unsigned        n;
{
	unsigned m;

	m = channel->end - channel->curr;
	if( channel->curr == channel->buff && n >= m )
	{
		really_write( channel->fd, p, n );
		channel->offset += n;
	}
	else
	   if( n <= m )
		{
			bcopy( p, channel->curr, n );
			channel->curr += n;
			
			if( channel->curr > channel->max )
			   channel->max = channel->curr;
		}
		else
		{
			bcopy( p, channel->curr, m );
			p += m;
			n -= m;
			m  = channel->end - channel->buff;
			
			really_write( channel->fd, channel->buff, m );
			
			channel->offset += m;
			if( n <= m )
			{
				bcopy( p, channel->buff, n );
				channel->curr = channel->max = channel->buff + n;
			}
			else
			{
				really_write( channel->fd, p, n );
				channel->offset += n;
				channel->curr = channel->max = channel->buff;
			}
		}
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    output ...                                                       */
/*---------------------------------------------------------------------*/
value
output( channel, buff, start, length )
value channel, buff, start, length;
{
	putblock( (struct channel *) channel,
             &Byte( buff, Long_of_val( start ) ),
             (unsigned) Long_of_val( length ) );
	return Atom( 0 );
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    seek_out ...                                                     */
/*---------------------------------------------------------------------*/
value
seek_out( channel, pos )
struct channel *channel;
value           pos;
{
	long dest;

	dest = Long_of_val( pos );
	
	if (dest >= channel->offset &&
		 dest <= channel->offset + channel->max - channel->buff)
	{
		channel->curr = channel->buff + dest - channel->offset;
	}
	else
	{
		flush( channel );
		
		if( lseek( channel->fd, dest, 0 ) != dest )
		   sys_error();
		
		channel->offset = dest;
	}
	return Atom( 0 );
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    pos_out ...                                                      */
/*---------------------------------------------------------------------*/
value
pos_out( channel )
struct channel *channel;
{
	return Val_of_long( channel->offset + channel->curr - channel->buff );
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    close_out ...                                                    */
/*---------------------------------------------------------------------*/
value
close_out( channel )
struct channel *channel;
{
	flush( channel );
	close( channel->fd );
	
	stat_free( (char *) channel );
	
	return Atom( 0 );
}

/*---------------------------------------------------------------------*/
/*    static int                                                       */
/*    really_read ...                                                  */
/*---------------------------------------------------------------------*/
static int
really_read( fd, p, n )
int       fd;
char     *p;
unsigned  n;
{
	int retcode;

	retcode = read( fd, p, n );
	
	if (retcode == -1)
	   sys_error();
	else
	   return retcode;
}

/*---------------------------------------------------------------------*/
/*    unsigned char                                                    */
/*    refill ...                                                       */
/*---------------------------------------------------------------------*/
unsigned char
refill( channel )
struct channel *channel;
{
	int n;

	n = really_read( channel->fd, channel->buff, IO_BUFFER_SIZE );
	
	if( n == 0 )
	   mlraise( Atom( END_OF_FILE_EXN ) );
	
	channel->offset += n;
	channel->max     = channel->buff + n;
	channel->curr    = channel->buff + 1;
	
	return (unsigned char)(channel->buff[0]);
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    intput_char ...                                                  */
/*---------------------------------------------------------------------*/
value
intput_char( channel )
struct channel *channel;
{
	unsigned char c;
	
	c = getch( channel );
	
	return BCHAR( c );
}

/*---------------------------------------------------------------------*/
/*    long                                                             */
/*    getword ...                                                      */
/*---------------------------------------------------------------------*/
long
getword( channel )
struct channel *channel;
{
   int i;
   long res;

   res = 0;
   for( i = 0; i < 4; i++ )
	{
		res = (res << 8) + getch( channel );
   }
	
	return res;
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    input_char ...                                                   */
/*---------------------------------------------------------------------*/
value
input_char( channel )
struct channel *channel;
{
	unsigned char c;
	
	c = getch( channel );
	
	return BCHAR( c );
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    input_int ...                                                    */
/*---------------------------------------------------------------------*/
value input_int( channel )
struct channel *channel;
{
   return Val_of_long( getword( channel ) );
}

/*---------------------------------------------------------------------*/
/*    unsigned                                                         */
/*    getblock ...                                                     */
/*---------------------------------------------------------------------*/
unsigned
getblock( channel, p, n )
struct channel *channel;
char           *p;
unsigned        n;
{
  unsigned m, l;

  m = channel->max - channel->curr;
  
  if( n <= m )
  {
    bcopy( channel->curr, p, n );
    channel->curr += n;
    return n;
  }
  else
     if( m > 0 )
     {  
		  bcopy( channel->curr, p, m );
		  channel->curr += m;
		  return m;
	  }
	  else
	     if( n < IO_BUFFER_SIZE )
		  {
			  l = really_read( channel->fd, channel->buff, IO_BUFFER_SIZE );
			  channel->offset += l;
			  channel->max = channel->buff + l;
			  
			  if( n > l ) n = l;
			  
			  bcopy( channel->buff, p, n );
			  channel->curr = channel->buff + n;
			  return n;
		  }
		  else
		  {
			  l = really_read( channel->fd, p, n );
			  channel->offset += l;
			  return l;
		  }
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    realyy_getblock ...                                              */
/*---------------------------------------------------------------------*/
unsigned char
really_getblock( chan, p, n )
struct channel *chan;
char           *p;
unsigned long   n;
{
	unsigned r;
	
	while( n > 0 )
	{
		r = getblock( chan, p, (unsigned) n );
		
		if( r == 0 )
		   return 0;
		
		p += r;
		n -= r;
	}
	
	return 1;
}
 
/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    intern_value ...                                                 */
/*---------------------------------------------------------------------*/
unsigned char
intern_value( channel, buff, start, length )
struct channel *channel;
value buff, start, length;
{
	return really_getblock( channel,
								   &Byte( buff, Long_of_val( start ) ),
								   (unsigned)Long_of_val( length ) );
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    input ...                                                        */
/*---------------------------------------------------------------------*/
value
input( channel, buff, start, length )
struct channel *channel;
value buff, start, length;
{
	return Val_of_long( getblock( channel,
									   &Byte( buff, Long_of_val( start ) ),
									   (unsigned)Long_of_val( length ) ) );
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    seek_in ...                                                      */
/*---------------------------------------------------------------------*/
value
seek_in( channel, pos )
struct channel *channel;
value           pos;
{
	long dest;
	
	dest = Long_of_val( pos );
	
	if( dest >= channel->offset - (channel->max - channel->buff) &&
      dest <= channel->offset )
	{
		channel->curr = channel->max - (channel->offset - dest);
	}
	else
	{
		if( lseek(channel->fd, dest, 0) != dest )
		   sys_error();
		
		channel->offset = dest;
		channel->curr = channel->max = channel->buff;
	}
	return Atom( 0 );
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    pos_int ...                                                      */
/*---------------------------------------------------------------------*/
value
pos_in( channel )
struct channel *channel;
{
	return Val_of_long( channel->offset - (channel->max - channel->curr) );
}

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    close_int ...                                                    */
/*---------------------------------------------------------------------*/
value
close_in( channel )
struct channel *channel;
{
	close( channel->fd );
	
	stat_free( (char *) channel );
	
	return Atom( 0 );
}

/*---------------------------------------------------------------------*/
/*    static value                                                     */
/*    build_string ...                                                 */
/*---------------------------------------------------------------------*/
static value
build_string( pref, start, end )
value pref;
char *start, *end;
{
	value    res;
	mlsize_t preflen;

	if( pref )
	{
		preflen = string_length( pref );
	  
		res = alloc_string( preflen + end - start );
	  
		bcopy( &Byte( pref, 0 ), &Byte( res, 0 ), preflen );
		bcopy( start, &Byte( res, preflen ), end - start );
	}
	else
	{
		res = alloc_string( end - start );
	  
		bcopy( start, &Byte( res, 0 ), end - start );
	}
	
	return res;
}
 
/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    input_line ...                                                   */
/*---------------------------------------------------------------------*/
value
input_line( channel )
struct channel *channel;
{
	char *start;
	int   n;
	value res;
	value prevstring = 0L;
	
	start = channel->curr;
	
	do
	{
		if( channel->curr >= channel->max )
		{
			/* No more characters available */
			if( start > channel->buff )
			{
				/* First, make as much room as possible */
				bcopy( start, channel->buff, channel->max - start );

				n = start - channel->buff;       /* in the buffer */
				channel->curr -= n;
				channel->max  -= n;
				start = channel->buff;
			}
			
			if( channel->curr >= channel->end )
			{
				/* Buffer full? */
				prevstring = build_string( prevstring, start, channel->curr );
				
				start = channel->buff;             /* Flush it in the heap */
				channel->curr = channel->buff;
			}
			
			n = really_read( channel->fd,
								  channel->curr,
								  channel->end-channel->curr );
			
			if( n == 0 )
			{
				mlraise( Atom( END_OF_FILE_EXN ) );
			}
			
			channel->offset += n;
			channel->max = channel->curr + n;
		}
	}
	while( *(channel->curr)++ != '\n' );
	
	res = build_string( prevstring, start, channel->curr - 1 );

	return res;
}
									  
