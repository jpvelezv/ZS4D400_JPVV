CLASS zcl_jpvv_21_string_functions DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_JPVV_21_STRING_FUNCTIONS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA text   TYPE string VALUE `  Let's talk about ABAP  `.
    DATA result1 TYPE i.
    DATA result2 TYPE i.
    DATA result3 TYPE i.
    DATA result4 TYPE i.
    DATA result5 TYPE i.
    DATA result6 TYPE i.
    DATA result7 TYPE i.
    DATA result8 TYPE i.

    out->write( text ).

    result1 = find( val = text sub = 'A' ).

    result2 = find( val = text sub = 'A' case = abap_false ).

    result3 = find( val = text sub = 'A' case = abap_false occ =  -1 ).
    result4 = find( val = text sub = 'A' case = abap_false occ =  -2 ).
    result5 = find( val = text sub = 'A' case = abap_false occ =   2 ).

    result6 = find( val = text sub = 'A' case = abap_false occ = 2 off = 10 ).
    result7 = find( val = text sub = 'A' case = abap_false occ = 2 off = 10 len = 4 ).
    result8 = find( val = text sub = 'A' case = abap_false occ = 1 off = 10 len = 4 ).

    out->write( |RESULT1 = { result1 } | ).
    out->write( |RESULT2 = { result2 } | ).
    out->write( |RESULT3 = { result3 } | ).
    out->write( |RESULT4 = { result4 } | ).
    out->write( |RESULT5 = { result5 } | ).
    out->write( |RESULT6 = { result6 } | ).
    out->write( |RESULT7 = { result7 } | ).
    out->write( |RESULT8 = { result8 } | ).

  ENDMETHOD.
ENDCLASS.
