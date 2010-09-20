/*=====================================================================*/
/*    serrano/ml/camloo/runtime0.2/Include/value-bigloo.h ...          */
/*    -------------------------------------------------------------    */
/*    Author      :  Manuel Serrano                                    */
/*    Creation    :  Sun Dec 12 14:34:48 1993                          */
/*    Last change :  Sat Nov 12 09:52:28 1994 (serrano)                */
/*    -------------------------------------------------------------    */
/*    Le pendant du fichier `mlvalue.h' de la distribution de caml-    */
/*    light                                                            */
/*=====================================================================*/
#ifndef CAML_VALUE_BIGLOO_H
#define CAML_VALUE_BIGLOO_H

#include <bigloo.h>
#include "Clib/caml-bigloo.h"

/*---------------------------------------------------------------------*/
/*    Les types                                                        */
/*---------------------------------------------------------------------*/
typedef obj_t value;
typedef unsigned int mlsize_t;
typedef unsigned char *code_t;

/*---------------------------------------------------------------------*/
/*    Les constructeurs                                                */
/*---------------------------------------------------------------------*/
#define Tag_of_val( i )							   \
  ( ( CAML_REGULAR_CONSTRP( i ) ?										\
	  CAML_REGULAR_CONSTR_TAG( i ) :									\
	  ( CAML_CONSTANT_CONSTRP( i ) ?									\
		CAML_CONSTANT_CONSTR_TAG ( i ) :								\
		( CAML_CONS_CONSTRP( i ) ?										\
		  CAML_CONS_CONSTR_TAG( i ) : 0	) ) ) - 1 )

#define Field( x, i )                                     \
  ( CAML_CONS_CONSTRP( x ) ?							  \
	( i ? CDR( x ) : CAR( x ) ) :						  \
	CAML_CONSTR_GET_FIELD( x, i ) )

#define FieldSet( x, i, v )									 \
  ( CAML_CONS_CONSTRP( x ) ?								 \
	( i ? SET_CDR( x, v ) : SET_CAR( x, v ) ) :				 \
	CAML_CONSTR_SET_FIELD( x, i, v ) )

#define Wosize_val( i ) CAML_CONSTR_LENGTH( i )

/*---------------------------------------------------------------------*/
/*    Le trippotage des entiers                                        */
/*---------------------------------------------------------------------*/
#define Long_of_val( i ) CINT( i )
#define Val_of_long( i ) BINT( i )
#define Int_of_val( x ) ((int) Long_of_val( x ))
#define Val_of_int( x ) Val_of_long( x )

#define Max_long ((1L << (8 * sizeof( value ) - 2)) - 1)

/*---------------------------------------------------------------------*/
/*    Des floats                                                       */
/*---------------------------------------------------------------------*/
#define copy_double(x ) DOUBLE_TO_REAL( x )

/*---------------------------------------------------------------------*/
/*    Les tags                                                         */
/*---------------------------------------------------------------------*/
typedef unsigned int tag_t;

/*---------------------------------------------------------------------*/
/*    Les manipulations des floats                                     */
/*---------------------------------------------------------------------*/
#define Double_of_val( x ) REAL_TO_DOUBLE( x )

/*---------------------------------------------------------------------*/
/*    Le trippotage des chars                                          */
/*---------------------------------------------------------------------*/

/*---------------------------------------------------------------------*/
/*    Le trippotage des booleens                                       */
/*---------------------------------------------------------------------*/
#define Val_of_bool( x ) BBOOL( x )
#define Bool_of_val( x ) CBOOL( x )
#define Val_of_false     BFALSE
#define Val_of_true      BTRUE
#define Val_of_unit      Atom( 0 )

/*---------------------------------------------------------------------*/
/*    Le trippotage des strings                                        */
/*---------------------------------------------------------------------*/
#define String_of_val( ml )     BSTRING_TO_STRING( ml )
#define copy_string( c_string ) string_to_bstring( c_string )
#define string_length( s )      STRING_LENGTH( s )

#define Byte( x, i )    BSTRING_TO_STRING( x )[ i ]
#define Byte_u( x, i )  ((unsigned char *)BSTRING_TO_STRING( x ))[ i ]

/*---------------------------------------------------------------------*/
/*    Les atoms                                                        */
/*---------------------------------------------------------------------*/
#define Atom( x ) BCNST( x + 1 )

/*---------------------------------------------------------------------*/
/*    Les fonctions de memory.c                                        */
/*---------------------------------------------------------------------*/
#define stat_alloc  (char *)malloc
#define stat_free   free
#define stat_resize realloc

/*---------------------------------------------------------------------*/
/*    Les fonctions de alloc.c                                         */
/*---------------------------------------------------------------------*/
extern obj_t make_string( long, unsigned char );
// extern obj_t make_vector();
extern obj_t caml_allocate_regular( obj_t, int );

#define alloc_string( len )  make_string( len , ' ' )
#define alloc_tuple( csize )											\
  caml_allocate_regular( 0L, csize  ) // TODO: thomas 14/04/10: is 0L a valid tag ?
#define alloc( csize, ctag )								\
  caml_allocate_regular( CAML_MAKE_TAG( ctag ), csize )

extern value copy_string_array();

/*---------------------------------------------------------------------*/
/*    Les macros du GC                                                 */
/*---------------------------------------------------------------------*/
#define Push_roots( name, size ) value name [(size) + 2];
#define Pop_roots()

#define leave_blocking_section()
#define enter_blocking_section()

#define Is_in_heap( x ) ( 1 )
#define Is_young( x )   ( 0 )

/*---------------------------------------------------------------------*/
/*    Les differents tags                                              */
/*---------------------------------------------------------------------*/
#define Num_tags     BINT( 1 << 8 )
#define No_scan_tag  BINT( (CINT( Num_tags ) - 4) )
#define Closure_tag  BINT( (CINT( No_scan_tag ) - 1) )
#define String_tag   BINT( (CINT( No_scan_tag ) + 1) )
#define Double_tag   BINT( (CINT( No_scan_tag ) + 2) )
#define Scan_tag     BINT( (CINT( No_scan_tag ) - 2) )
#define Abstract_tag No_scan_tag
#define Final_tag    Scan_tag

/*---------------------------------------------------------------------*/
/*    Les fonctions                                                    */
/*---------------------------------------------------------------------*/

/*---------------------------------------------------------------------*/
/*    Les choses des parseurs                                          */
/*---------------------------------------------------------------------*/
#define callback( fun, arg ) PROCEDURE_ENTRY( fun )( fun, arg, BEOA )
#endif

