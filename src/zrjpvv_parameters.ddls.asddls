@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS with Parameters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZRJPVV_PARAMETERS
  with parameters
    targetCurr : abap.cuky,
    @Environment.systemField: #SYSTEM_DATE
    ExRateDate : abap.dats
  as select from ZRJPVV_EMPLOYEE
{
  key Employee,
      FirstName,
      LastName,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      AnnualSalary,
      CurrencyCode,

      @Semantics.amount.currencyCode: 'TargetCurrency'
      currency_conversion( amount => AnnualSalary,
                          source_currency => CurrencyCode,
                          target_currency => $parameters.targetCurr,
                          exchange_rate_date => $parameters.ExRateDate
                          )  as AnnualSalaryConverted,
      $parameters.targetCurr as TargetCurrency,
      $session.system_date   as ExchangeRateDate
}
