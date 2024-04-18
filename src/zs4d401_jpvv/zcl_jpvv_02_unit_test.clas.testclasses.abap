*"* use this source file for your ABAP unit test classes
CLASS ltcl_testcarrier DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      test_get_name FOR TESTING RAISING cx_static_check,
      test_get_currency FOR TESTING RAISING cx_static_check.
    DATA : carrier TYPE REF TO lcl_carrier.
ENDCLASS.


CLASS ltcl_testcarrier IMPLEMENTATION.

  METHOD setup.
    "Fetching an arbitrary carrier's id
    SELECT SINGLE FROM /dmo/carrier
    FIELDS carrier_id
    INTO @DATA(carrier_id).
    IF sy-subrc <> 0.
      cl_abap_unit_assert=>skip(
        msg    = 'No data in /DMO/CARRIER'
        detail = 'Test requires atleast one entry in the DB table /DMO/CARRIER'
      ).
    ENDIF.
    TRY.
        "Creating a carrier object with the arbitrary carrier ID
        me->carrier = NEW lcl_carrier( i_carrier_id =  carrier_id ).
      CATCH cx_abap_invalid_value.
        cl_abap_unit_assert=>fail( msg    = `Object creation failed`
                                   level  = if_abap_unit_constant=>severity-medium
                                   quit   = if_abap_unit_constant=>quit-test
                                   detail = `The constructor raises an exception when it should not ` ).
    ENDTRY.
  ENDMETHOD.

  METHOD test_get_name.
    "Identifying if the attribute contains the carrier's name
    DATA(name) = me->carrier->get_name( ).
    "Asserting that the object (name attribute in this case) is not initial
    cl_abap_unit_assert=>assert_not_initial(
      EXPORTING
        act  = name
        msg  = 'Result of the method get_name( )'
        quit = if_abap_unit_constant=>quit-no
    ).
  ENDMETHOD.

  METHOD test_get_currency.
    "Asserting that the currency attribute is not initial
    cl_abap_unit_assert=>assert_not_initial(
      EXPORTING
        act  = me->carrier->get_currency( )
        msg  = 'Result of the method get_name( )'
        quit = if_abap_unit_constant=>quit-no
    ).
  ENDMETHOD.

ENDCLASS.
