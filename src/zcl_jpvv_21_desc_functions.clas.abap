CLASS zcl_jpvv_21_desc_functions DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jpvv_21_desc_functions IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA result1 TYPE i.
    DATA result2 TYPE i.
    DATA result3 TYPE i.
    DATA result4 TYPE i.
    DATA result5 TYPE i.
    DATA result6 TYPE i.
    DATA result7 TYPE i.
    DATA result8 TYPE i.

    DATA text    TYPE string VALUE `  ABAP  `.
    DATA substring TYPE string VALUE `AB`.
    DATA offset    TYPE i      VALUE 1.

* Call different description functions
******************************************************************************
    result1 = strlen(     text ).
    result2 = numofchar(  text ).

    result3 = count( val = text sub = substring off = offset ).
    result4 = find(             val = text sub = substring off = offset ).

    result5 = count_any_of(     val = text sub = substring off = offset ).
    result6 = find_any_of(      val = text sub = substring off = offset ).

    result7 = count_any_not_of( val = text sub = substring off = offset ).
    result8 = find_any_not_of(  val = text sub = substring off = offset ).

    out->write( |Text      = `{ text }`| ).
    out->write( |Substring = `{ substring }` | ).
    out->write( |Offset    = { offset } | ).
    out->write( |Result1    = { result1 } | ).
    out->write( |Result2    = { result2 } | ).
    out->write( |Result3    = { result3 } | ).
    out->write( |Result4    = { result4 } | ).
    out->write( |Result5    = { result5 } | ).
    out->write( |Result6    = { result6 } | ).
    out->write( |Result7    = { result7 } | ).
    out->write( |Result8    = { result8 } | ).

  ENDMETHOD.
ENDCLASS.
