# Discounts Operations

Discounts or commissions are a way for you to check what percentage discount rate will you get for each operator when
you send a successful top-up. These operations can be used to calculate your profits. All Commissions are paid instantly
when a top-up is processed.

One thing to note on the response is that All Operators provide two types of discounts, One is the international
discount, and the other is the local discount. These are returned as the internationalPercentage and localPercentage
fields in the response object. Depending on your account currency the country you are sending the topup to, you are
eligible for either one of these discounts. For example if you're sending from the US to Canada you will be eligible for
the international discount for the canadian operator. While sending within the same country you will be eligible for the
local discount of the operator **if available**. Note that, local discount may not always be available; in which case
the international discount will be applied.

## Discounts - List

```swift
  ReloadlyAirtime.shared.getDiscountsList() { result in
       switch result {
       case .success(let discounts):
           print(discounts)
       case .failure(let error):
           print(error)
       }
   }

```

## Discount - List with filters

```swift
ReloadlyAirtime.shared.getDiscountsList(page: 1, size: 20) { result in
     switch result {
     case .success(let discounts):
         print(discounts)
     case .failure(let error):
         print(error)
     }
 }
```  

## Discounts - Get by operator id

```swift
  ReloadlyAirtime.shared.getDiscountsByOperator(id: Int) { result in
      switch result {
      case .success(let discounts):
          print(discounts)
      case .failure(let error):
          print(error)
      }
  }
```
