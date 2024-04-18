*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_flight DEFINITION.

  PUBLIC SECTION.
    TYPES tt_flights TYPE STANDARD TABLE OF /dmo/flight
                     WITH NON-UNIQUE KEY carrier_id connection_id.
    CLASS-DATA r_flights TYPE TABLE OF /dmo/flight.
    CLASS-METHODS get_flights
      RETURNING VALUE(r_result) TYPE tt_flights
      RAISING   cx_abap_invalid_value.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS lcl_flight IMPLEMENTATION.

  METHOD get_flights.
    "Fetching all details of flights
    SELECT FROM /dmo/flight FIELDS *
    INTO TABLE @r_result.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
