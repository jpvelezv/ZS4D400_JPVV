CLASS zcl_jpvv_01_unit_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_JPVV_01_UNIT_TEST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( 'test1' ).
    CONSTANTS c_carrier_id TYPE /dmo/carrier_id VALUE 'XX'.

    out->write( 'test2' ).

    TRY.
        DATA(carrier) = lcl_data=>get_carrier( i_carrier_id = c_carrier_id ).
        out->write( carrier ).
        out->write( |test3 | ).

        "catch cx_class.

      CATCH cx_abap_invalid_value.
        out->write( | Carrier { c_carrier_id } does not exist  | ).
        out->write( 'test4 ' ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
