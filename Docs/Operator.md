# Operators Operations

Apart from supporting Over 140 Countries, Reloadly also supports 600+ Operators. The SDK operators options allows for
the retrieval complete detail of each operator, including what type of operator this is, what topup types it support and
even details on the commissions for the operator.

Within the reloadly platform, There exists two types of Operators. One that support Range values (Anything between the
minimum and maximum range). While the other that support Fixed values (Only a certain values are supported). Reloadly
will return you the type of the operator within the response in denominationType variable. If this is set to ```RANGE```
you will receive the minimum and maximum values in the minAmount and maxAmount variables for that operator. However, if
the denomination type is ```FIXED``` you will not get these values but rather get an array of all values supported in
the fixedAmounts variable. **Now a point to remember here is that these values are already converted into your account's
currency**.

## Operators - List

```swift
  ReloadlyAirtime.shared.getOperatorsList() { result in
      switch result {
      case .success(let list):
          print(list)
      case .failure(let error):
          print(error)
      }
  }
```

By default, ```getOperatorsList()``` returns a paginated list of operators with 20 operators per page.

## Operators - List with filters

Additional operator filters may be enabled

```java
        includeBundles: Bool? //Whether to include bundle operators in the returned resource list. See field "bundle" on the [API Docs](https://developers.reloadly.com/api.html#list-all-operators).
        includePin: Bool? //Whether to include PIN based operators in the returned resource list. See field "pin" on the [API Docs](https://developers.reloadly.com/api.html#list-all-operators).
        includeData: Bool? //Whether to include data (internet) operators in the returned resource list. See field "data" on the [API Docs](https://developers.reloadly.com/api.html#list-all-operators).
        suggestedAmounts: Bool? //Whether to populate the suggestedAmounts field on the operators in the returned resource list, this only applies to operators where denominationType is RANGE. See field "suggestedAmounts" on the [API Docs](https://developers.reloadly.com/api.html#list-all-operators).
        suggestedAmountsMap: Bool? //Whether to populate the suggestedAmountsMap field on the operators in the returned resource list. This field represents a map of international amounts to local amounts for a given operator where applicable. See field "suggestedAmountsMap" on the [API Docs](https://developers.reloadly.com/api.html#list-all-operators).
        simplified: Bool? // Whether to return Simplified response or Detailed one. [API Docs](https://developers.reloadly.com/api.html#list-all-operators).
  ReloadlyAirtime.shared.getOperatorsList(page: Int, size: Int, suggestedAmounts: Bool?, suggestedAmountsMap: Bool?, includeBundles: Bool?, simplified: Bool?, includePin: Bool?, includeData: Bool?) { result in
      switch result {
      case .success(let list):
          print(list)
      case .failure(let error):
          print(error)
      }
  }
```

By default all the above filters are set to ```true``` except for ```includeSuggestedAmounts```
,  ```includeSuggestedAmountsMap``` and ```supportsGeographicalRechargePlan```

## Operators - Get by id

```swift
  ReloadlyAirtime.shared.getOperatorById(id: Int, suggestedAmounts: Bool?, suggestedAmountsMap: Bool?, supportsGeographicalRechargePlan: Bool? = nil,) { result in
      switch result {
      case .success(let data):
          print(data)
      case .failure(let error):
          print(error)
      }
  }
```
## Operators - Get by country (Filters available)

```swift
  ReloadlyAirtime.shared.getOperatorByCountry(country: "US") { result in
      switch result {
      case .success(let data):
          print(data)
      case .failure(let error):
          print(error)
      }
  }
```

## Operators - Auto-detect

Reloadly also provide a simple way to automatically detect the operator for any given number. Filters not required

```swift  
  ReloadlyAirtime.shared.getOperatorForPhone(phone: "+123456789", countryCode: "US", suggestedAmounts: Bool?, suggestedAmountsMap: Bool?) { result in
      switch result {
      case .success(let data):
          print(data)
      case .failure(let error):
          print(error)
      }
  }

```

## Operators - Calculate FX rate

In order to estimate what amount will be received on the receiver end. For example, If your account is in US Dollar and
you are trying to send a transaction to a nigerian operator, you can quickly calculate what amount you will receive in
Nigerian Naira.

```swift
  ReloadlyAirtime.shared.calculateFXRate(operatorId: 1, amount: 5.00) { result in
      switch result {
      case .success(let data):
          print(data)
      case .failure(let error):
          print(error)
      }
  }
```
