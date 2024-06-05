CLASS zcl_jpvv_05_profiling DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_JPVV_05_PROFILING IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "Retrieving details of all connections
    DATA(connections) = lcl_connection=>get_connections( ).
    "Sorting data as per the carriers and their connections
    SORT connections BY carrier_id connection_id ASCENDING.
    "Iterating over the list of connections
    LOOP AT connections INTO DATA(connection).
      "Retrieving the source city of connection
      DATA(city_from) = lcl_connection=>get_airport_city( connection-airport_from_id ).
      "Retrieving the destination city of connection
      DATA(city_to) = lcl_connection=>get_airport_city( connection-airport_to_id ).
      "Processing data for displaying them
      DATA(text) = |Flight {  connection-carrier_id } { connection-connection_id } | &&
                   |from {  city_from } to { city_to }|.
      out->write( `--------------------------------------------------------------------` ).
      out->write( text ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
