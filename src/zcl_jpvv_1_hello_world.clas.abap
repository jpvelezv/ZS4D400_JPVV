CLASS zcl_jpvv_1_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_JPVV_1_HELLO_WORLD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " a comment
*    out->write( 'Hello World' ).
    out->write( 'Hello World Again' ).
  ENDMETHOD.
ENDCLASS.
