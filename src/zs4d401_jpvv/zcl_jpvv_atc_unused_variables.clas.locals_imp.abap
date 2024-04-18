*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_data DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS:
      get_carrier IMPORTING carrier_id        TYPE /dmo/carrier_id
                  RETURNING VALUE(rs_carrier) TYPE /dmo/carrier
                  RAISING   cx_abap_invalid_value.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_data IMPLEMENTATION.

  METHOD get_carrier.
    "Get crrier data:
    SELECT SINGLE FROM /dmo/carrier
    FIELDS *
    WHERE carrier_id = @carrier_id
    INTO @rs_carrier.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
