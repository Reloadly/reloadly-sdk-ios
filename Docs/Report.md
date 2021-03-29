# Report Operations

Retrieve various reports such as transaction history etc...

## Reports - List transaction history (filters not required)

```swift
ReloadlyAirtime.shared.getTransactionsList(page: Int, size: Int, countryCode: String?, operatorId: Int?, operatorName: String?, startDate: String?, endDate: String?, customIdentifier: String?) { result in
      switch result {
      case .success(let data):
          print(data)
      case .failure(let error):
          print(error)
      }
  }
```
## Reports - Get transaction history by id

```swift
ReloadlyAirtime.shared.getTransactionById(id: Int) { result in
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
