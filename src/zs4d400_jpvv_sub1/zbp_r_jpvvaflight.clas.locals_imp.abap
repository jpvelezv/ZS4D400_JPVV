CLASS lhc_zr_jpvvaflight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:

      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR connection
        RESULT result,

      checksemantickey FOR VALIDATE ON SAVE
        IMPORTING keys FOR connection~checksemantickey,
      checkcarrierid FOR VALIDATE ON SAVE
        IMPORTING keys FOR connection~checkcarrierid,
      CheckOriginDestination FOR VALIDATE ON SAVE
        IMPORTING keys FOR Connection~CheckOriginDestination,
      getcities FOR DETERMINE ON SAVE
        IMPORTING keys FOR connection~getcities.
ENDCLASS.

CLASS lhc_zr_jpvvaflight IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD checksemantickey.
    READ ENTITIES OF zr_jpvvaflight IN LOCAL MODE
             ENTITY connection
             FIELDS ( carrierid connectionid )
               WITH CORRESPONDING #( keys )
             RESULT DATA(connections).

    LOOP AT connections INTO DATA(connection).

      SELECT FROM zjpvvaflight
             FIELDS uuid
              WHERE carrier_id    = @connection-carrierid
                AND connection_id = @connection-connectionid
                AND uuid          <> @connection-uuid
      UNION
      SELECT FROM zjpvvaflight_d
             FIELDS uuid
              WHERE carrierid     = @connection-carrierid
                AND connectionid  = @connection-connectionid
                AND uuid          <> @connection-uuid

      INTO TABLE @DATA(check_result).

      IF check_result IS NOT INITIAL.

        DATA(message) = me->new_message(
          id       = 'ZS4D400_JPVV'
          number   = '001'
          severity = ms-error
          v1       = connection-carrierid
          v2       = connection-connectionid
        ).

        DATA reported_record LIKE LINE OF reported-connection.

        reported_record-%tky = connection-%tky.
        reported_record-%msg = message.
        reported_record-%element-carrierid    = if_abap_behv=>mk-on.
        reported_record-%element-connectionid = if_abap_behv=>mk-on.

        APPEND reported_record TO reported-connection.


        DATA failed_record LIKE LINE OF failed-connection.

        failed_record-%tky = connection-%tky.

        APPEND failed_record TO failed-connection.

      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD checkcarrierid.

    READ ENTITIES OF zr_jpvvaflight IN LOCAL MODE
          ENTITY connection
          FIELDS ( carrierid )
            WITH  CORRESPONDING #( keys )
          RESULT DATA(connections).

    LOOP AT connections INTO DATA(connection).
      SELECT SINGLE
        FROM /dmo/i_carrier
      FIELDS @abap_true
       WHERE airlineid = @connection-carrierid
        INTO @DATA(exists).

      IF exists = abap_false.
        DATA(message) = me->new_message(
          id       = 'ZS4D400_JPVV'
          number   = '002'
          severity = ms-error
          v1       = connection-carrierid
        ).

        DATA reported_record LIKE LINE OF reported-connection.

        reported_record-%tky = connection-%tky.
        reported_record-%msg = message.
        reported_record-%element-carrierid = if_abap_behv=>mk-on.

        APPEND reported_record TO reported-connection.

        DATA failed_record LIKE LINE OF failed-connection.

        failed_record-%tky = connection-%tky.
        APPEND failed_record TO failed-connection.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD CheckOriginDestination.
    DATA: reported_record LIKE LINE OF reported-connection,
          failed_record   LIKE LINE OF failed-connection.

    READ ENTITIES OF zr_jpvvaflight IN LOCAL MODE
    ENTITY Connection FIELDS ( AirportFromID AirportToID )
    WITH CORRESPONDING #( keys ) RESULT DATA(connections).

    LOOP AT connections INTO DATA(connection).
      IF connection-AirportFromID = connection-AirportToID.
        DATA(message) = me->new_message(
          id       = 'ZS4D400_JPVV'
          number   = '003'
          severity = ms-error ).

        reported_record-%tky = connection-%tky.
        reported_record-%msg = message.
        reported_record-%element-airportfromid = if_abap_behv=>mk-on.
        reported_record-%element-airporttoid = if_abap_behv=>mk-on.
        APPEND reported_record TO reported-connection.

        failed_record-%tky = connection-%tky.
        APPEND failed_record TO failed-connection.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD getcities.

    READ ENTITIES OF zr_jpvvaflight IN LOCAL MODE
           ENTITY connection
           FIELDS ( airportfromid airporttoid )
             WITH CORRESPONDING #( keys )
           RESULT DATA(connections).

    LOOP AT connections INTO DATA(connection).

      SELECT SINGLE
        FROM /dmo/i_airport
      FIELDS city, countrycode
       WHERE airportid = @connection-airportfromid
        INTO ( @connection-cityfrom, @connection-countryfrom ).

      SELECT SINGLE
        FROM /dmo/i_airport
      FIELDS city, countrycode
       WHERE airportid = @connection-airporttoid
        INTO ( @connection-cityto, @connection-countryto ).

      MODIFY connections FROM connection.

    ENDLOOP.

    DATA connections_upd TYPE TABLE FOR UPDATE zr_jpvvaflight.

    connections_upd = CORRESPONDING #( connections ).

    MODIFY ENTITIES OF zr_jpvvaflight IN LOCAL MODE
             ENTITY connection
             UPDATE
             FIELDS ( cityfrom countryfrom cityto countryto )
               WITH connections_upd
           REPORTED DATA(reported_records).

    reported-connection = CORRESPONDING #( reported_records-connection ).

  ENDMETHOD.
ENDCLASS.
