CLASS zcl_jpvv_atc_unused_variables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jpvv_atc_unused_variables IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA carriers TYPE SORTED TABLE OF /dmo/carrier WITH UNIQUE KEY primary_key COMPONENTS carrier_id INITIAL SIZE 50.
    DATA text1 TYPE string ##needed .
    DATA text2 TYPE string. "#EC NEEDED

    SELECT FROM /DMO/connection
    FIELDS *
    INTO TABLE @DATA(connections).

*    connection_list = connection_list.

    LOOP AT connections ASSIGNING FIELD-SYMBOL(<connection>).
      ASSIGN carriers[ carrier_id = <connection>-carrier_id ] TO FIELD-SYMBOL(<carrier>) .
      CHECK sy-subrc <> 0.
      SELECT SINGLE FROM /dmo/carrier FIELDS name, currency_code
        WHERE carrier_id = @<connection>-carrier_id
        INTO ( @DATA(carrier_name), @DATA(carrier_curr) ).
      IF sy-subrc <> 0.
        CLEAR: carrier_name, carrier_curr.
      ENDIF.

      INSERT VALUE #( carrier_id = <connection>-carrier_id name = carrier_name currency_code = carrier_curr )
       INTO TABLE carriers.
    ENDLOOP.

    out->write( connections ).
    out->write( 'Carriers:' ).
    out->write( carriers ).
  ENDMETHOD.
ENDCLASS.
