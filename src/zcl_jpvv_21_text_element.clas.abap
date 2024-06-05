CLASS zcl_jpvv_21_text_element DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_JPVV_21_TEXT_ELEMENT IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    out->write( TEXT-001 ).
    out->write( 'How are you?'(hau) ).

  ENDMETHOD.
ENDCLASS.
