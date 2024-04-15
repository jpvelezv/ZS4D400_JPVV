CLASS zcl_jpvv_copy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jpvv_copy IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA itab TYPE TABLE OF zjpvvaflight.
* fill internal travel table (itab)
    itab = VALUE #(
    (
        uuid = '02D5290E594C1EDA93815057FD946624'
        carrier_id = 'KL'
        connection_id = 'KL2100'
        airport_from_id  = 'AMS'
        city_from  = 'Amsterdam'
        country_from = 'NL'
        airport_to_id  = 'BRL'
        city_to = 'Berlin' country_to = 'DE' local_created_by = 'PIPO' local_created_at  = '20190612133945.5960060'
    local_last_changed_by = 'PIPPO' local_last_changed_at = '20190702105400.3647680'
    last_changed_at = '20190702105400.3647680' )
     ( uuid = '02D5290E594C1EDA93815057FD946654' carrier_id = 'AA'  connection_id = 'AA2606'
    airport_from_id  = 'MLB'  city_from  = 'Melbourne' country_from = 'AU' airport_to_id  = 'JFK'
    city_to = 'New York' country_to = 'US' local_created_by = 'PIPO' local_created_at  = '20190412133945.5999060'
    local_last_changed_by = 'PIPPO' local_last_changed_at = '20190712105400.3647680'
    last_changed_at = '20190712105400.3647680' )
     ( uuid = '02D5290E594C1EDA93815057FD947624' carrier_id = 'KL'  connection_id = 'KL2107'
    airport_from_id  = 'AMS'  city_from  = 'Amsterdam' country_from = 'NL' airport_to_id  = 'BRL'
    city_to = 'Berlin' country_to = 'DE' local_created_by = 'PIPO' local_created_at  = '20200612133945.5960060'
    local_last_changed_by = 'PIPPO' local_last_changed_at = '20200702105400.3647680'
    last_changed_at = '20200702105400.3647680' )
    ).
* delete existing entries in the database table
    DELETE FROM zjpvvaflight.
* insert the new table entries
    INSERT zjpvvaflight FROM TABLE @itab.
* output the result as a console message
    out->write( |{ sy-dbcnt } travel entries inserted successfully!| ).
  ENDMETHOD.
ENDCLASS.
