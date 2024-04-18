*"* use this source file for your ABAP unit test classes

CLASS ltcl_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      test_success FOR TESTING RAISING cx_static_check,
      test_exception FOR TESTING.

ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD test_success.
    "Preparation: Read an arbitrary carrier_id from db
    SELECT SINGLE
    FROM /dmo/carrier
    FIELDS carrier_id
    INTO @DATA(carrier_id).

    IF sy-subrc <> 0.
      cl_abap_unit_assert=>fail( 'TEST requires AT least one entry in db table /dmo/carrier' ).
    ENDIF.

    "Do the test of method lcl_data=>get_carrier( ).
**********************************************************************
    TRY.
        DATA(carrier) = lcl_data=>get_carrier( carrier_id ).
      CATCH cx_abap_invalid_value.
        cl_abap_unit_assert=>fail(
          msg    = 'Inapropriate exception'
          detail = 'Method lcl_data=>get_carrier( ) RAISE an exception WHEN it should not' ).

    ENDTRY.

  ENDMETHOD.

  METHOD test_exception.

    CONSTANTS c_wrong_carrier_id TYPE /dmo/carrier_id VALUE 'XX'.

    SELECT SINGLE
    FROM /dmo/carrier
    FIELDS carrier_id
    WHERE carrier_id = @c_wrong_carrier_id
    INTO @DATA(carrier_id).

    IF sy-subrc = 0.
      cl_abap_unit_assert=>fail(
        msg    = |Carrier { c_wrong_carrier_id } exists in /DMO/CARRIER |
        level  = if_abap_unit_constant=>severity-high
        quit   = if_abap_unit_constant=>quit-test
        detail = 'if db table /dmo/carrier contains an entry' && | with carrer_id = ‘ { c_wrong_carrier_id } ‘ | && 'it is not possible to TEST the exception' ).
    ENDIF.


    TRY.
        DATA(carrier) = lcl_data=>get_carrier( carrier_id ).

        cl_abap_unit_assert=>fail(
          msg    = 'No exception'
          level  = if_abap_unit_constant=>severity-medium
          quit   = if_abap_unit_constant=>quit-test
          detail = 'Method lcl_data=>get_carrier( ) doest not raise an exception when it should do so' ).
      CATCH cx_abap_invalid_value.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
