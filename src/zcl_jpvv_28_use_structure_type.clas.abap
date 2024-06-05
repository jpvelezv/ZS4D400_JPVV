CLASS zcl_jpvv_28_use_structure_type DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_JPVV_28_USE_STRUCTURE_TYPE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA person TYPE zsjpvv_person.

*    person-address-country_code = 'US'.
    person-country_code = 'US'.
    person-address-country_code = 'US'.
  ENDMETHOD.
ENDCLASS.
