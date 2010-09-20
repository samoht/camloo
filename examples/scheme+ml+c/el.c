#include "type.h"

void
print_el_list( l )
struct el *l;
{
	printf( "in C: printing l converted into a C structure: " );
	
	printf( "( ");
	
	while( l )
	{
		printf( "%d ", l->value );
		l = l->next;
	}
	puts( ")" );
	
	printf( "in C: printing Scheme result: %d\n", fib( 20 ) );
}
