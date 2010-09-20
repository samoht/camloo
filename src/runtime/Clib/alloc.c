#include <bigloo.h>
#include "Clib/value-bigloo.h"

/*---------------------------------------------------------------------*/
/*    Les externes                                                     */
/*---------------------------------------------------------------------*/
extern obj_t make_vector();

/*---------------------------------------------------------------------*/
/*    value                                                            */
/*    copy_string_array ...                                            */
/*---------------------------------------------------------------------*/
value
copy_string_array( arr )
char **arr;
{
	long   nbr = 0, i;
	obj_t res;
	
	while( arr[ nbr ] )
	   nbr++;

	res = make_vector( nbr, BUNSPEC );

	for( i = 0; i < nbr; i ++ )
	   VECTOR_SET( res, i, string_to_bstring( arr[ i ] ) );

	return res;
}

/*---------------------------------------------------------------------*/
/*    long                                                             */
/*    convert_flag_list ...                                            */
/*---------------------------------------------------------------------*/
int
convert_flag_list( list, flags )
value  list;
int   *flags;
{
  int res; 
  res = 0;
  
  while( !NULLP( list ) )
  {
    res |= flags[ Tag_of_val( Field( list, 0 ) ) ];
    list = Field( list, 1 );
  }
   
  return res;
}
