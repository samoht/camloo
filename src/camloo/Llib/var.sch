;*=====================================================================*/
;*    serrano/ml/camloo/comptime0.2/Camloo/var.sch ...                 */
;*    -------------------------------------------------------------    */
;*    Author      :  Manuel Serrano                                    */
;*    Creation    :  Wed Dec  1 13:55:28 1993                          */
;*    Last change :  Thu Jun  2 09:59:31 1994 (serrano)                */
;*    -------------------------------------------------------------    */
;*    Les structures pour memoriser les variables                      */
;*=====================================================================*/

;*---------------------------------------------------------------------*/
;*    global                                                           */
;*---------------------------------------------------------------------*/
(define-struct global
   name       ;; symbol   : le nom de la variable
   module     ;; symbol   : le nom du module qui definie la variable
   exported?  ;; booleen  : la variable est elle exportee
   function?  ;; booleen  : Est-ce une fonction ?
   arity      ;; int      : arite de la fonction
   args       ;; args *   : une liste d'argument pour les decurryfiees.
   bname      ;; symbol   : if set, it's the corresponding bigloo function name
   defined?)  ;; booleen  : A-t-on trouve la definition de cette variable ?

;*---------------------------------------------------------------------*/
;*    local                                                            */
;*---------------------------------------------------------------------*/
(define-struct local
   name       ;; symbol   : le nom de la variable
   property   ;; symbol   : une propriete < ref, ::, [], ... >
   value?     ;; booleen  : la variable est-elle utilisee comme valeur
   occur)     ;; integer  : le nb d'occurrence de cette variable
