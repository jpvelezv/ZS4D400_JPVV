@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS with Parameters Use'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZRJPVV_USE_PARAMETERS
  as select from ZRJPVV_PARAMETERS( targetCurr: 'EUR', ExRateDate: $session.system_date )
{
  key Employee,
      FirstName,
      LastName,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      AnnualSalary,
      CurrencyCode,
      @Semantics.amount.currencyCode: 'TargetCurrency'
      AnnualSalaryConverted,
      TargetCurrency,
      ExchangeRateDate
}
