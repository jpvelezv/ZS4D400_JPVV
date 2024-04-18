CLASS zcl_jpvv_04_profiling DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jpvv_04_profiling IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TRY.
        "Retrieving details of flights
        DATA(flights) = lcl_flight=>get_flights( ).
        "Sorting data as per date
        SORT flights BY flight_date DESCENDING.
        "Displaying all details
        out->write( name = `List of all flights`
                    data = flights ).
      CATCH cx_abap_invalid_value.
        "Error text
        out->write(  | Exception occured | ) .
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
