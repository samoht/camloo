#include <bigloo.h>
#include "Clib/mlvalues.h"
#include "Clib/value-bigloo.h"

static unsigned long hash_accu;
static long hash_univ_limit, hash_univ_count;

static void hash_aux();

value hash_univ_param(count, limit, obj) /* ML */
     value obj, count, limit;
{
  hash_univ_limit = Long_of_val(limit);
  hash_univ_count = Long_of_val(count);
  hash_accu = 0;
  hash_aux(obj);
  return Val_of_long(hash_accu & Max_long);
}
 
#define Alpha ((unsigned long)65599)
#define Beta ((unsigned long)19)
#define Combine(new)  (hash_accu = hash_accu * Alpha + (new))
#define Combine_small(new) (hash_accu = hash_accu * Beta + (new))

static void hash_aux(obj)
     value obj;
{
  unsigned char * p;
  mlsize_t i;

  hash_univ_limit--;
  if (hash_univ_count < 0 || hash_univ_limit < 0) return;

  if( STRINGP( obj ) )
  {
	  hash_univ_count--;
	  
     i = STRING_LENGTH( obj );
	   
     for( p = &Byte_u( obj, 0 ); i > 0; i--, p++ )
	     Combine_small( *p );
  }
  else
     if( REALP( obj ) )
	  {
		  hash_univ_count--;
		  Combine( REAL_TO_DOUBLE( obj ) );
	  }
     else
	  {
		  if( CNSTP( obj ) )
		  {
		     hash_univ_count--;
			  Combine( (unsigned long)obj );
		  }
		  else
		  {
			  if( CHARP( obj ) )
			  {
				  hash_univ_count--;
				  Combine( CCHAR( obj ) );
			  }
			  else
			  if( Is_block( obj ) )
			  {
				  i = Wosize_val( obj );
				  
				  while( i != 0 )
				  {
					  i--;
					  hash_aux( Field( obj, i ) );
				  }
			  }
			  else
			  {
				  hash_univ_count--;
				  Combine((long) obj);
			  }
		  }
	  }
}
