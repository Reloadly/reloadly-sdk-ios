# Promotions Operations

Reloady also support operators promotions. These are provided by the operators and can be activated by sending a
specific topup amount as per the details of the promotion. Using the promotion operations you can retrieve all details
on the different operators promotions and to showcase these to your customers.

## Promotions - List

```swift
ReloadlyAirtime.shared.getPromotionsList() { result in
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
## Promotions - Get by id

```swift
ReloadlyAirtime.shared.getPromotionsById(id: Int) { result in
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```

## Promotions - Get by operator id

```swift
ReloadlyAirtime.shared.getPromotionsByOperatorId(id: Int) { result in
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```

## Promotions - Get by country code

```swift
ReloadlyAirtime.shared.getPromotionsByCountryCode(countryCode: String) { result in
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
