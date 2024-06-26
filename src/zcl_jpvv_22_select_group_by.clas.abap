CLASS zcl_jpvv_22_select_group_by DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_JPVV_22_SELECT_GROUP_BY IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/connection
         FIELDS
            carrier_id,

                MAX( distance ) AS max,
                MIN( distance ) AS min,
                SUM( distance ) AS sum,
                COUNT( * ) AS count

     GROUP BY carrier_id
     HAVING MAX( distance ) > 0
         INTO TABLE @DATA(result).
    out->write(
      EXPORTING
        data = result
        name = 'RESULT'
    ).

  ENDMETHOD.
ENDCLASS.
