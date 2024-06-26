CLASS zcl_jpvv_22_select_distinct DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_JPVV_22_SELECT_DISTINCT IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/connection
       FIELDS
*           DISTINCT
              airport_from_id,
              distance_unit

     ORDER BY airport_from_id
         INTO TABLE @DATA(result).

    out->write(
      EXPORTING
        data = result
        name = 'RESULT WITHOUT DISTINC'
    ).

    SELECT FROM /dmo/connection
   FIELDS DISTINCT
          airport_from_id,
          distance_unit

 ORDER BY airport_from_id
     INTO TABLE @DATA(result2).

    out->write(
      EXPORTING
        data = result2
        name = 'RESULT WITH DISTINC'
    ).

  ENDMETHOD.
ENDCLASS.
