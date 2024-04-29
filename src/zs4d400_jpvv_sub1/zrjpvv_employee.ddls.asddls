@AbapCatalog.dataMaintenance: #RESTRICTED
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@AbapCatalog.entityBuffer.definitionAllowed: true
define view entity ZRJPVV_EMPLOYEE
  as select from ztjpvv_employee
  association [1..1] to ztjpvv_departmen as _Department on $projection.DepartmentId = _Department.department_id
{
  key employee                as Employee,
      first_name              as FirstName,
      last_name               as LastName,
      birth_date              as BirthDate,
      entry_date              as EntryDate,
      department_id           as DepartmentId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      annual_salary           as AnnualSalary,
      currency_code           as CurrencyCode,
      created_user            as CreatedUser,
      created_time            as CreatedTime,
      local_last_changed_user as LocalLastChangedUser,
      local_last_changed_time as LocalLastChangedTime,
      last_changed_user       as LastChangedUser,
      _Department
}
