#include <bigloo.h>
#include <errno.h>
#include <fcntl.h>
#include "Clib/value-bigloo.h"
#include "Clib/fail.h"

#ifndef O_BINARY
#define O_BINARY 0
#endif
#ifndef O_TEXT
#define O_TEXT 0
#endif

/*---------------------------------------------------------------------*/
/*    Les externs                                                      */
/*---------------------------------------------------------------------*/
extern int errno;

/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    sys_error ...                                                    */
/*---------------------------------------------------------------------*/
void
sys_error()
{
	raise_with_string( SYS_ERROR_EXN, strerror(errno) );
}


/*---------------------------------------------------------------------*/
/*    sys_open_flags                                                   */
/*---------------------------------------------------------------------*/
static int sys_open_flags[] = {
  O_RDONLY, O_WRONLY, O_RDWR, O_APPEND, O_CREAT, O_TRUNC, O_EXCL,
  O_BINARY, O_TEXT
};

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    sys_open ...                                                     */
/*---------------------------------------------------------------------*/
value
sys_open( path, flags, perm )
value path, flags, perm;
{
	int ret;

	ret = open( String_of_val( path ),
				   convert_flag_list( flags, sys_open_flags ),
				   Int_of_val( perm ) );

	if( ret == -1 )
	   sys_error();
	else
	   return Val_of_long( ret );
}
 

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    sys_close ...                                                    */
/*---------------------------------------------------------------------*/
value
sys_close( fd )
value fd;
{
	if( close( Int_of_val( fd ) ) != 0)
	   sys_error();
	else
	   return Val_of_unit;
}


