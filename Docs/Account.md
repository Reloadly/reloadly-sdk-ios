# Account Operations

Use the account operations to perform account related actions

## Retrieve account balance info

```swift
    ReloadlyAirtime.shared.getAccountBalance() { result in
            switch result {
            case .success(let balance):
                print(balance)
            case .failure(let error):
                print(error)
            }
        }
```