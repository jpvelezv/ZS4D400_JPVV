*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_carrier DEFINITION.
  PUBLIC SECTION.
    "Method for fetching details of a carrier
    METHODS constructor
      IMPORTING i_carrier_id TYPE /dmo/carrier_id
      RAISING   cx_abap_invalid_value.
    "Method for returning the carrier's name
    METHODS get_name            RETURNING VALUE(r_result) TYPE /dmo/carrier_name.
    "Method for returning the carrier's currency
    METHODS get_currency        RETURNING VALUE(r_result) TYPE /dmo/currency_code.
  PROTECTED SECTION.
  PRIVATE SECTION.
    "Attribute for recording carrier data
    DATA carrier_data TYPE /dmo/carrier.
ENDCLASS.



CLASS lcl_carrier IMPLEMENTATION.

  METHOD constructor.
    "Retrieving details of a single carrier
    SELECT SINGLE * FROM /dmo/carrier
    WHERE carrier_id = @i_carrier_id
    INTO @me->carrier_data.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.
  ENDMETHOD.

  METHOD get_currency.
    "Returning carrier's currency
    r_result = me->carrier_data-currency_code.
  ENDMETHOD.

  METHOD get_name.
    "Returning carrier's name
    r_result = me->carrier_data-name.
  ENDMETHOD.

ENDCLASS.
