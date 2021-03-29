# Countries Operations

Reloadly supports 140+ Countries around the globe. You can get a list of all or specific supported countries. The
response will give you a list with complete details, iso, flag as well as calling codes for each country. You can also
further filter the countries by getting details for a specific country by its ISO-Alpha2 code.
See https://www.nationsonline.org/oneworld/country_code_list.htm for more details regarding country ISO codes.

## Countries - List

```swift
  ReloadlyAirtime.shared.getCountryList() { result in
      switch result {
      case .success(let contryList):
          print(contryList)
      case .failure(let error):
          print(error)
      }
  }
```

## Countries - Get by country ISO code

```swift
  ReloadlyAirtime.shared.getCountryByCode(code: "US") { result in
      switch result {
      case .success(let country):
          print(country)
      case .failure(let error):
          print(error)
      }
  }
```
