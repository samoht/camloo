#include <bigloo.h>
#include <stdarg.h>
#include "Clib/caml-bigloo.h"

/* 'Regular' vectors are for variant types; The constructor ID is encoded
   with the size (22 bits for the size, 8 for the constructor ID);
   Exceptions can be considererd as open variants; they are encoded into
   'extensible' vectors. */


/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    caml_allocate_regular ...                                        */
/*---------------------------------------------------------------------*/
obj_t
caml_allocate_regular( obj_t tag, int size )
{
	obj_t vect;
    printf("caml_allocate_regular(%d)\n", size);

	vect = create_vector( size + 1 );
	//VECTOR_TAG_SET( vect, tag );
	CAML_CONSTR_SET_FIELD( vect , size, tag);

	return vect;
}
	 
/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    caml_make_regular ...                                            */
/*    -------------------------------------------------------------    */
/*    L'allocateur generale de constructeurs reguliers                 */
/*---------------------------------------------------------------------*/
obj_t
caml_make_regular( obj_t tag, int size, ... )
{
	va_list argl;
    obj_t   vect;
	int    i;

	/* Cette allocation doit etre la meme que celle faite dans le   */
	/* fichier Clib/vector.c de la librairie.                       */
	vect = create_vector( size + 1 );
	
	//	VECTOR_TAG_SET( vect, tag );

	/* on initialise les differents champs du vecteurs              */
	va_start( argl, size );
	for( i = 0; i < size; i++ )
	   CAML_CONSTR_SET_FIELD( vect, i, va_arg( argl, obj_t ) );
	va_end( argl );

	CAML_CONSTR_SET_FIELD( vect, size, tag);

	return vect;
} 

/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    caml_make_regular_1 ...                                          */
/*---------------------------------------------------------------------*/
obj_t
caml_make_regular_1( tag, val )
obj_t tag, val;
{
 	obj_t vect;

	vect = create_vector( 2 );
	//VECTOR_TAG_SET( vect, tag );
	CAML_CONSTR_SET_FIELD( vect, 0, val);
	CAML_CONSTR_SET_FIELD( vect, 1, tag);

	return vect;
}

/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    caml_make_regular_2 ...                                          */
/*---------------------------------------------------------------------*/
obj_t
caml_make_regular_2( tag, val0, val1 )
obj_t tag, val0, val1;
{
 	obj_t vect;

	vect = create_vector( 3 );
	//	VECTOR_TAG_SET( vect, tag );
	CAML_CONSTR_SET_FIELD( vect, 0, val0);
	CAML_CONSTR_SET_FIELD( vect, 1, val1);
	CAML_CONSTR_SET_FIELD( vect, 2, tag);

	return vect;
}

/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    caml_make_regular_3 ...                                          */
/*---------------------------------------------------------------------*/
obj_t
caml_make_regular_3( tag, val0, val1, val2 )
obj_t tag, val0, val1, val2;
{
 	obj_t vect;

	vect = create_vector( 4 );
	// VECTOR_TAG_SET( vect, tag );
	CAML_CONSTR_SET_FIELD( vect, 0, val0);
	CAML_CONSTR_SET_FIELD( vect, 1, val1);
	CAML_CONSTR_SET_FIELD( vect, 2, val2);
	CAML_CONSTR_SET_FIELD( vect, 3, tag);

	return vect;
}

/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    caml_make_regular_4 ...                                          */
/*---------------------------------------------------------------------*/
obj_t
caml_make_regular_4( tag, val0, val1, val2, val3 )
obj_t tag, val0, val1, val2, val3;
{
 	obj_t vect;

	vect = create_vector( 5 );
	//	VECTOR_TAG_SET( vect, tag );
	CAML_CONSTR_SET_FIELD( vect, 0, val0);
	CAML_CONSTR_SET_FIELD( vect, 1, val1);
	CAML_CONSTR_SET_FIELD( vect, 2, val2);
	CAML_CONSTR_SET_FIELD( vect, 3, val3);
	CAML_CONSTR_SET_FIELD( vect, 4, tag);

	return vect;
}




/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    caml_make_extensible ...                                         */
/*    -------------------------------------------------------------    */
/*    L'allocateur generale de constructeurs extensibles               */
/*---------------------------------------------------------------------*/
// TODO: personne semble l'utiliser (thomas, 15/04/2010)
obj_t
caml_make_extensible( obj_t tag, int size, ... )
{
	va_list argl;
	obj_t   vect;
	int    i;

	/* Cette allocation doit etre la meme que celle faite dans le   */
	/* fichier Clib/vector.c de la librairie.                       */
	vect = create_vector( size + 2 );
	//VECTOR_TAG_SET( vect, CAML_EXTENSIBLE_TAG );

	/* on initialise les differents champs du vecteurs              */
	va_start( argl, size );
	for( i = 0; i < size; i++ )
	   CAML_CONSTR_SET_FIELD( vect, i, va_arg( argl, obj_t ) );
	va_end( argl );

	CAML_CONSTR_SET_FIELD( vect, size, tag);
	CAML_CONSTR_SET_FIELD( vect, size + 1, CAML_EXTENSIBLE_TAG );

	return vect;
}


/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    caml_make_extensible_1 ...                                       */
/*---------------------------------------------------------------------*/
obj_t
caml_make_extensible_1( tag, val0 )
obj_t tag, val0;
{
 	obj_t vect;

	vect = create_vector( 3 );
	//	VECTOR_TAG_SET( vect, CAML_EXTENSIBLE_TAG );
	CAML_CONSTR_SET_FIELD( vect, 0, val0);
	CAML_CONSTR_SET_FIELD( vect, 1, tag);
	CAML_CONSTR_SET_FIELD( vect, 2, CAML_EXTENSIBLE_TAG );

	return vect;
}

/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    caml_make_extensible_2 ...                                       */
/*---------------------------------------------------------------------*/
obj_t
caml_make_extensible_2( tag, val0, val1 )
obj_t tag, val0, val1;
{
 	obj_t vect;

	vect = create_vector( 4 );
	//	VECTOR_TAG_SET( vect, CAML_EXTENSIBLE_TAG );
	CAML_CONSTR_SET_FIELD( vect, 0, val0);
	CAML_CONSTR_SET_FIELD( vect, 1, val1);
	CAML_CONSTR_SET_FIELD( vect, 2, tag);
	CAML_CONSTR_SET_FIELD( vect, 3, CAML_EXTENSIBLE_TAG );

	return vect;
}

/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    caml_make_extensible_3 ...                                       */
/*---------------------------------------------------------------------*/
obj_t
caml_make_extensible_3( tag, val0, val1, val2 )
obj_t tag, val0, val1, val2;
{
 	obj_t vect;

	vect = create_vector( 5 );
	//	VECTOR_TAG_SET( vect, CAML_EXTENSIBLE_TAG );
	CAML_CONSTR_SET_FIELD( vect, 0, val0);
	CAML_CONSTR_SET_FIELD( vect, 1, val1);
	CAML_CONSTR_SET_FIELD( vect, 2, val2);
	CAML_CONSTR_SET_FIELD( vect, 3, tag);
	CAML_CONSTR_SET_FIELD( vect, 4, CAML_EXTENSIBLE_TAG );

	return vect;
}

/*---------------------------------------------------------------------*/
/*    obj_t                                                            */
/*    caml_make_extensible_4 ...                                       */
/*---------------------------------------------------------------------*/
obj_t
caml_make_extensible_4( tag, val0, val1, val2, val3 )
obj_t tag, val0, val1, val2, val3;
{
 	obj_t vect;

	vect = create_vector( 6 );
	//	VECTOR_TAG_SET( vect, CAML_EXTENSIBLE_TAG );
	CAML_CONSTR_SET_FIELD( vect, 0, val0);
	CAML_CONSTR_SET_FIELD( vect, 1, val1);
	CAML_CONSTR_SET_FIELD( vect, 2, val2);
	CAML_CONSTR_SET_FIELD( vect, 3, val3);
	CAML_CONSTR_SET_FIELD( vect, 4, tag);
	CAML_CONSTR_SET_FIELD( vect, 6, CAML_EXTENSIBLE_TAG );

	return vect;
}
