#include <bigloo.h>
#include "Clib/caml-bigloo.h"
#include "Clib/value-bigloo.h"
#include "Clib/fail.h"

/*---------------------------------------------------------------------*/
/*    Les recuperations externes                                       */
/*---------------------------------------------------------------------*/
extern obj_t caml_make_extensible(obj_t tag, int size, ... );

#undef raise
#define raise CAML_RAISE___CAML_HANDLE

/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    mlraise ...                                                      */
/*---------------------------------------------------------------------*/
void
mlraise( v )
value v;
{
	if( CAML_EXTENSIBLE_CONSTRP( v ) )
	   raise( v );
	else
	   if( CNSTP( v ) )
	      switch( CCNST( v ) - 1 )
		   {
			   case( OUT_OF_MEMORY_EXN ) :
				   raise( string_to_symbol( "Out_of_memory_1@exc" ) );
				   break;
   
			   case( END_OF_FILE_EXN ) :
				   raise( string_to_symbol( "End_of_file_1@io" ) );
				   break;

			   case( UNIX_ERROR_EXN ) :
				   raise( string_to_symbol( "Unix_error_1@unix" ) );
					break;

			   default :
				 raise( string_to_symbol( "Unknown_exception_1" ) );
				 break;
		   }
	   else
		   raise( string_to_symbol( "Unknown_exception_1" ) );
}

/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    raise_with_arg ...                                               */
/*---------------------------------------------------------------------*/
void
raise_with_arg( tag, arg )
tag_t tag;
value arg;
{
	obj_t new_tag;

	switch( tag )
	{
      case( OUT_OF_MEMORY_EXN ) :
 		   new_tag = string_to_symbol( "Out_of_memory_1@exc" );
			break;

      case( INVALID_EXN ) : 
         new_tag = string_to_symbol( "Invalid_argument_2@exc" );
			break;
			
      case( FAILURE_EXN ) : 
         new_tag = string_to_symbol( "Failure_3@exc" );
			break;

      case( NOT_FOUND_EXN ) : 
         new_tag = string_to_symbol( "Not_found_4@exc" );
			break;
			
	   case( SYS_ERROR_EXN ) :
		   new_tag = string_to_symbol( "Sys_error_1@sys" );
			break;

      case( BREAK_EXN ) : 
         new_tag = string_to_symbol( "Break_2@sys" );
			break;
			
      case( END_OF_FILE_EXN ) : 
         new_tag = string_to_symbol( "End_of_file_1@io" );
			break;
			
      case( ZERO_DIVIDE_EXN ) : 
         new_tag = string_to_symbol( "Division_by_zero_1@int" );
			break;
			
      case( UNIX_ERROR_EXN ) : 
         new_tag = string_to_symbol( "Unix_error_1@unix" );
			break;
			
      case( GRAPHIC_FAILURE_EXN ) : 
         new_tag = string_to_symbol( "Graphic_failure_1@graphics" );
			break;
			
      case( PARSE_FAILURE_EXN ) : 
         new_tag = string_to_symbol( "Parse_failure_1@stream" );
			break;
			
	   default:
			new_tag = string_to_symbol( "Unknown_exception_1" );
	}
	
	mlraise( caml_make_extensible_1( new_tag, arg ) );
}

/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    raise_with_string ...                                            */
/*---------------------------------------------------------------------*/
void
raise_with_string( tag, msg )
tag_t  tag;
char  *msg;
{
	raise_with_arg( tag, string_to_bstring( msg ) );
}

/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    failwith ...                                                     */
/*---------------------------------------------------------------------*/
void
failwith( msg )
char *msg;
{
	raise_with_string( INVALID_EXN, msg );
}
			
/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    invalid_argument ...                                             */
/*---------------------------------------------------------------------*/
void
invalid_argument( msg )
char *msg;
{
  raise_with_string( INVALID_EXN, msg );
}

/*---------------------------------------------------------------------*/
/*    void                                                             */
/*    raise_out_of_memory ...                                          */
/*---------------------------------------------------------------------*/
void
raise_out_of_memory()
{
  mlraise( Atom( OUT_OF_MEMORY_EXN ) );
}

