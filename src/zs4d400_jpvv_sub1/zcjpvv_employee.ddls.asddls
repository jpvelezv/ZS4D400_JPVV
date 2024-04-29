@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCJPVV_EMPLOYEE
  as select from ZRJPVV_EMPLOYEE
{
  key Employee,
      FirstName,
      LastName,
      BirthDate,
      EntryDate,
      DepartmentId,
      @Semantics.amount.currencyCode: 'Currcode'
      AnnualSalary,
      CurrencyCode as Currcode,
      CreatedUser,
      CreatedTime,
      LocalLastChangedUser,
      LocalLastChangedTime,
      LastChangedUser,
      _Department.depment_designation
}
