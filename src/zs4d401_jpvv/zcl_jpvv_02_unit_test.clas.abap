CLASS zcl_jpvv_02_unit_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_JPVV_02_UNIT_TEST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "Constant for storing a carrier ID
    CONSTANTS c_carrier_id TYPE /dmo/carrier_id VALUE '$&'.
    TRY.
        "Invoking method to instantiate a carrier object
        DATA(carrier) = NEW lcl_carrier(  c_carrier_id ).
        "Displaying carrier details
        out->write( | Carrier { carrier->get_name( ) } has currency { carrier->get_currency( ) }| ).
      CATCH cx_abap_invalid_value.
        "Displaying error text
        out->write( | Carrier { c_carrier_id } does not exist | ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
