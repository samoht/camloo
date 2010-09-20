#include <bigloo.h>

/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    compare_strings ...                                              */
/*---------------------------------------------------------------------*/
obj_t
compare_strings( o1, o2 )
obj_t o1, o2;
{
	long  len1, len2, len;
	char *p1, *p2;
	long  i;
	
	
	len1 = CINT( STRING_LENGTH( o1 ) );
	len2 = CINT( STRING_LENGTH( o2 ) );

	p1 = BSTRING_TO_STRING( o1 );
	p2 = BSTRING_TO_STRING( o2 );

	for( len = (len1 <= len2 ? len1 : len2); len > 0; len--, p1++, p2++ )
	   if (*p1 != *p2)
		   return (*p1 < *p2 ? BINT( -1 ) : BINT( 1 ) );

	if( len1 == len2 )
	   return BINT( 0 );
	else
	   if( len1 < len2 )
		   return BINT( -2 );
	   else
		   return BINT( 2 );
}
