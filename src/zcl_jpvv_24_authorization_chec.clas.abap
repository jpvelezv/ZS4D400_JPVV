CLASS zcl_jpvv_24_authorization_chec DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_JPVV_24_AUTHORIZATION_CHEC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA airports TYPE STANDARD TABLE OF /dmo/airport
                    WITH NON-UNIQUE KEY airport_id.

    AUTHORITY-CHECK OBJECT '/DMO/TRVL'
    ID 'CNTRY' FIELD 'US'
    ID 'ACTVT' FIELD '03'.

    IF sy-subrc = 0.

      SELECT FROM /dmo/airport
          FIELDS *
          WHERE country = 'US'
          INTO TABLE @airports.

      out->write( airports ).

    ELSE.
      out->write( 'No Authorization' ).

    ENDIF.
  ENDMETHOD.
ENDCLASS.
