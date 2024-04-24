CLASS zcl_jpvv_24_authorization DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jpvv_24_authorization IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA airports TYPE STANDARD TABLE OF /dmo/airport
                  WITH NON-UNIQUE KEY airport_id.

    SELECT FROM /dmo/airport
        FIELDS *
        WHERE country = 'US'
        INTO TABLE @airports.

    out->write( airports ).
  ENDMETHOD.
ENDCLASS.
