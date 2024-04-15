@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_JPVVAFLIGHT'
define root view entity ZC_JPVVAFLIGHT
  provider contract transactional_query
  as projection on ZR_JPVVAFLIGHT
{
  key UUID,
  CarrierID,
  ConnectionID,
  AirportFromID,
  CityFrom,
  CountryFrom,
  AirportToID,
  CityTo,
  CountryTo,
  LocalLastChangedAt
  
}
