/*=====================================================================*/
/*    serrano/trashcan/camloo0.3/lib/0.3/caml-bigloo.h                 */
/*    -------------------------------------------------------------    */
/*    Author      :  Manuel Serrano                                    */
/*    Creation    :  Tue Dec  7 08:13:51 1993                          */
/*    Last change :  Tue Apr  6 12:24:16 2010 (serrano)                */
/*    -------------------------------------------------------------    */
/*    Les nouvelles structures (et macro) pour la compilation de       */
/*    camllight                                                        */
/*=====================================================================*/
#ifndef CAML_BIGLOO_H
#define CAML_BIGLOO_H

#include "globals-bigloo.h"

/*---------------------------------------------------------------------*/
/*    Est-ce que camlc a ete patche pour Bigloo ?                      */
/*---------------------------------------------------------------------*/
#define CAMLC_PATCHED

/*---------------------------------------------------------------------*/
/*    Is_block ...                                                     */
/*---------------------------------------------------------------------*/
#define Is_block( x ) !(INTEGERP( x ))

// TODO (thomas 16/04/10: update comments 
/*---------------------------------------------------------------------*/
/*    Il existe plusieurs sortes de constructeurs. Chacun a un         */
/*    codage differents. Voyons au cas par cas comme les codages:      */
/*                                                                     */
/*       1) Les constructeurs constants: Ils sont mappes sur les       */
/*          constantes (macro BCNST) ce sont des valeurs immediates.   */
/*                                                                     */
/*       2) Les constructeurs non constants et non extensibles: Ils    */
/*          sont mappes sur les vecteurs. Leurs tags sont ranges dans  */
/*          les 8 bits de poids forts (inutilises) du mot contenant    */
/*          les tailles des dits vecteurs.                             */
/*                                                                     */
/*            +--------+--------+--------+--------+                    */
/*            |tt..signed fixed point value.....??|                    */
/*            +--------+--------+--------+--------+                    */
/*                                                                     */
/*          `tt' designe le tag, `??' est le tag des vecteurs.         */
/*                                                                     */
/*       3) Les constructeurs extensibles sont des vecteurs. Les 8     */
/*          de tags sont mis a une valeur particuliere, le vrai tag    */
/*          est range dans le dernier slot du vecteur.                 */
/*---------------------------------------------------------------------*/

/* Les exceptions/extensibles sont (apparement) soit:
   - un symbole pour les constantes; soit
   - un vector tagge avec CAML_EXTENSIBLE_TAG pour les non-constantes */

/*---------------------------------------------------------------------*/
/* TAGs are bigloo int stored in the vector's last slot                */
/*---------------------------------------------------------------------*/
#define CAML_MAKE_TAG( slot ) BCNST( slot + 1 )

/*---------------------------------------------------------------------*/
/*    Default tags                                                     */
/*---------------------------------------------------------------------*/
#define CAML_EXTENSIBLE_TAG   BCNST( 0 )   // exception
#define CAML_CONS_TAG         BCNST( 1 )   // list

/*---------------------------------------------------------------------*/
/*    Dynamic checs                                                    */
/*---------------------------------------------------------------------*/
// Is it a constant variant ?
#define CAML_CONSTANT_CONSTRP( c ) CNSTP( c )

// Is it a list ?
#define CAML_CONS_CONSTRP( c )	   PAIRP( c )

// Is it a non-constant variant ?
#define CAML_REGULAR_CONSTRP( c )							\
  ( !CAML_CONSTANT_CONSTRP( c ) &&							\
	!CAML_CONS_CONSTRP( c )     &&							\
	(__CAML_REGULAR_CONSTR_TAG( c ) != CAML_EXTENSIBLE_TAG) )

// May it be an exception ?
#define MAY_BE_AN_CAML_EXTENSIBLE_CONSTRP( c )	\
  ( SYMBOLP( c ) || VECTORP( c ) )

// Is it an exception ?
#define CAML_EXTENSIBLE_CONSTRP( c )							\
  ( !CAML_CONSTANT_CONSTRP( c ) &&								\
	!CAML_CONS_CONSTRP( c ) &&									\
	( SYMBOLP( c ) ||											\
	  (__CAML_REGULAR_CONSTR_TAG( c ) == CAML_EXTENSIBLE_TAG) ) )

/*---------------------------------------------------------------------*/
/*    Tag accessor                                                     */
/*---------------------------------------------------------------------*/
// non-constant variant : obj -> cst
#define __CAML_REGULAR_CONSTR_TAG( _caml_c_ )				\
  VECTOR_REF ( _caml_c_, VECTOR_LENGTH( _caml_c_ ) - 1 )

// obj -> int
#define CAML_REGULAR_CONSTR_TAG( _caml_c_ )		\
  CCNST ( __CAML_REGULAR_CONSTR_TAG( _caml_c_ ) )

// constant variant : obj -> int
#define CAML_CONSTANT_CONSTR_TAG( _caml_c_ )	\
  CCNST ( _caml_c_ )

// list : obj -> int (= fun _ -> 1)
#define CAML_CONS_CONSTR_TAG( _caml_c_ )		\
  CCNST ( CAML_CONS_TAG )

// exception : obj -> symbol
#define CAML_EXTENSIBLE_CONSTR_TAG( _caml_c_ )							\
  ( SYMBOLP( _caml_c_ ) ?												\
	_caml_c_  :															\
	( VECTOR_REF( _caml_c_, VECTOR_LENGTH( _caml_c_ ) - 2 ) ) )

// dispatcher
#define CAML_CONSTR_TAG( _caml_c_ )				   \
  ( CAML_REGULAR_CONSTRP( _caml_c_ ) ?			   \
	CAML_REGULAR_CONSTR_TAG( _caml_c_ ) :          \
	( CAML_CONSTANT_CONSTRP( _caml_c_ ) ?          \
	  CAML_CONSTANT_CONSTR_TAG ( _caml_c_ ) :      \
	  ( CAML_CONS_CONSTRP( _caml_c_ ) ?            \
		CAML_CONS_CONSTR_TAG( _caml_c_ ) :         \
		CAML_EXTENSIBLE_CONSTR_TAG( _caml_c_ ) ) ) )

/*---------------------------------------------------------------------*/
/*    Length, ie. number of parameters                                 */
/*---------------------------------------------------------------------*/
// non-constant variant : obj -> int
#define CAML_REGULAR_CONSTR_LENGTH( _caml_c_ )	\
  ( VECTOR_LENGTH( _caml_c_ ) - 1 )

// constant variant
#define CAML_CONSTANT_CONSTR_LENGTH( _caml_c_ ) 0

// list
#define CAML_CONS_CONSTR_LENGTH( _caml_c_ ) 2

// exception
#define CAML_EXTENSIBLE_CONSTR_LENGTH( _caml_c_ )	\
  ( VECTOR_LENGTH( _caml_c_ ) - 2 )

// dispatcher
#define CAML_CONSTR_LENGTH( _caml_c_ )					\
  ( CAML_CONSTANT_CONSTRP( _caml_c_ ) ?					\
	CAML_CONSTANT_CONSTR_LENGTH( _caml_c_ ) :			\
	( CAML_CONS_CONSTRP( _caml_c_ ) ?					\
	  CAML_CONS_CONSTR_LENGTH( _caml_c_ ) :				\
	  ( CAML_REGULAR_CONSTRP( _caml_c_ ) ?				\
		CAML_REGULAR_CONSTR_LENGTH( _caml_c_ ) :		\
		CAML_EXTENSIBLE_CONSTR_LENGTH( _caml_c_ ) ) ) )


/*---------------------------------------------------------------------*/
/*    CAML_REGULAR_CONSTR_REPLACE_TAG                                  */
/*---------------------------------------------------------------------*/
#define VECTOR_REPLACE_TAG( c1, c2 )								\
  CAML_CONSTR_SET_FIELD( c1,										\
						 VECTOR_LENGTH(c1) - 1,						\
						 VECTOR_REF( c2, VECTOR_LENGTH(c2) - 1 ))

/* on garde cette definition car je ne sais pas si on peut la virer */
/* ...a suivre                                                      */
  // #define CAML_REGULAR_CONSTR_REPLACE_TAG VECTOR_REPLACE_TAG

#define CAML_REGULAR_CONSTR_SET_TAG( obj, tag )			\
  CAML_CONSTR_SET_FIELD ( obj, VECTOR_LENGTH(obj) - 1, tag)

/*---------------------------------------------------------------------*/
/*    Les acces aux champs                                             */
/*---------------------------------------------------------------------*/	
#define CAML_CONSTR_GET_FIELD( _caml_c_, i )	\
  VECTOR_REF( _caml_c_, i )

#define CAML_CONSTR_SET_FIELD( _caml_c_, i, v )	\
  VECTOR_SET( _caml_c_, i, v )

#endif
