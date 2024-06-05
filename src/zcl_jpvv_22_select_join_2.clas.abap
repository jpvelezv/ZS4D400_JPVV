CLASS zcl_jpvv_22_select_join_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_JPVV_22_SELECT_JOIN_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/Agency AS a
                   INNER JOIN /dmo/customer AS c
*           LEFT OUTER JOIN /dmo/customer AS c
*          RIGHT OUTER JOIN /dmo/customer AS c
                ON a~city         = c~city
            FIELDS agency_id,
                   name AS Agency_name,
                   a~city AS agency_city,
                   c~city AS customer_city,
                   customer_id,
                   last_name AS customer_name

             WHERE ( c~customer_id < '000010' OR c~customer_id IS NULL )
               AND ( a~agency_id   < '070010' OR a~agency_id   IS NULL )

              INTO TABLE @DATA(result_Join).


    out->write(
      EXPORTING
        data = result_join
        name = 'RESULT_JOIN'
    ).

    out->write( '/n' ).

    SELECT FROM /dmo/Agency AS a
*                   INNER JOIN /dmo/customer AS c
           LEFT OUTER JOIN /dmo/customer AS c
*          RIGHT OUTER JOIN /dmo/customer AS c
                ON a~city         = c~city
            FIELDS agency_id,
                   name AS Agency_name,
                   a~city AS agency_city,
                   c~city AS customer_city,
                   customer_id,
                   last_name AS customer_name

             WHERE ( c~customer_id < '000010' OR c~customer_id IS NULL )
               AND ( a~agency_id   < '070010' OR a~agency_id   IS NULL )

              INTO TABLE @DATA(result_Join_left).


    out->write(
      EXPORTING
        data = result_Join_left
        name = 'RESULT_JOIN_LEFT'
    ).

    out->write( '/n' ).

    SELECT FROM /dmo/Agency AS a
          RIGHT OUTER JOIN /dmo/customer AS c
                ON a~city         = c~city
            FIELDS agency_id,
                   name AS Agency_name,
                   a~city AS agency_city,
                   c~city AS customer_city,
                   customer_id,
                   last_name AS customer_name

             WHERE ( c~customer_id < '000010' OR c~customer_id IS NULL )
               AND ( a~agency_id   < '070010' OR a~agency_id   IS NULL )

              INTO TABLE @DATA(result_Join_right).


    out->write(
      EXPORTING
        data = result_Join_right
        name = 'RESULT_JOIN_RIGHT'
    ).

    out->write( '' ).



  ENDMETHOD.
ENDCLASS.
