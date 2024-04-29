*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

"! Flight Model Class
CLASS lcl_flights_model DEFINITION.
  PUBLIC SECTION.

    TYPES :
            "! Type for returning parameter of method {@link.METH:get_airports}
            tt_airports TYPE STANDARD TABLE OF /dmo/airport
                        WITH NON-UNIQUE KEY airport_id.
    METHODS :
      "! This method returns a list of airports for a given country
      "! There is an authorization check and possible activities
      "! are contained in the interface {@link ZIF_S4D401_CONSTANTS}
      "! @parameter iv_country | importing parameter for country
      "! @parameter rt_airports | returning parameter with list of flights
      get_airports IMPORTING iv_country         TYPE land1
                   RETURNING VALUE(rt_airports) TYPE tt_airports.
ENDCLASS.



CLASS lcl_flights_model IMPLEMENTATION.

  METHOD get_airports.
    AUTHORITY-CHECK OBJECT 'DMO/TRVL'
          ID '/DMO/COUNTRY' FIELD iv_country
          ID 'ACTVT' FIELD 'AUTH_DISPLAY'.
    IF sy-subrc = 0.
      SELECT FROM /dmo/airport FIELDS *
      WHERE country = @iv_country
      INTO TABLE @rt_airports.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
