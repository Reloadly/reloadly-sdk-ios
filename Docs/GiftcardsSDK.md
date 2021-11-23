# Giftcards SDK

Gift cards are an awesome way to send and receive value in a digital economy that is fast becoming the future. Reloadly's GiftCard SDK connects you to over 200 gift cards that can be used both locally and internationally across 140+ countries.
This enables you to purchase gift cards for both commercial and personal reasons. Some of the data you will need are your access token and the brand details of the gift card.
This documentation contains a reference to each endpoint in the GiftCard API. You can check it out to learn more about how they work.


## Get all products

```java
ReloadlyGiftcard.shared.getAllProducts() { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
```


## Get product by ID

You can access the details of a particular gift card by making a request with that gift card's product ID

```swift

ReloadlyGiftcard.shared.getProduct(by: Int) { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
```


## Get products by ISO Code

You can retrieve details of every gift card product that is available in a country

```swift

ReloadlyGiftcard.shared.getProductByISO(countryCode: String) { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
```

## Get all redeem instructions

Redeem instructions are useful for retrieving the value of a gift card. The redeem instructions provides details on how to redeem every gift card product made available by Reloadly.

```swift

ReloadlyGiftcard.shared.redeemInstruction() { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
```

## Get redeem instructions by brand ID

Retrieve the redeem instructions for a particular gift card brand

```swift

ReloadlyGiftcard.shared.redeemInstruction(by id: Int) { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
```

## Get all discounts

Fetch data of every gift card that has an available discount at the point of purchase

```swift

ReloadlyGiftcard.shared.allTransactions() { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
```

## Get discount by product ID

Get the details of an active discount on a particular gift card product

```swift

ReloadlyGiftcard.shared.transaction(by id: Int) { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
```

## Order a gift card

You can make a request to purchase any of the gift card products made available via Reloadly

```swift

ReloadlyGiftcard.shared.orderGiftcard(with productId: Int,
                              countryCode: String,
                              quantity: Int,
                              unitPrice: Double,
                              customIdentifier: String,
                              senderName: String,
                              recipientEmail: String) { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
```

## Get a redeem code

Retrieve details of an already purchased gift card's redeem code.
Note that in some cases, a purchased gift card's details may not be readily available due to the transaction still being processed. In this case, you can track the transaction details using the Get Transaction by ID endpoint.

```swift

ReloadlyGiftcard.shared.redeemCode(by transactionId: Int) { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
```
