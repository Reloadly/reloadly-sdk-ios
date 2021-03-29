# Topup Operations

In order to send a successful topup. There are a few prerequisites to the system. We need to know the phone number to
send the topup to, the operator id of the phone number, the country of the operator, the amount for the topup.

## Topups - Send topup to phone


```java
ReloadlyAirtime.shared.sendTopupsRequest(operatorId: 701, amount: 1.0, useLocalAmount: true, customIdentifier: "customID", recipientPhone: Phone(number: "+13059547862", countryCode: "US"), senderPhone: Phone(number: "+13059547862", countryCode: "US")) { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
```


## Topups - Send Nauta Cuba topups

Reloadly also supports Nauta Cuba for top-ups. However the process is a bit different from sending phone topups. Instead
of using ```PhoneTopupRequest``` use ```EmailTopupRequest```, substitute ```recipientPhone(phone)``` with ```recipientEmail(email)``` and that's it. The rest of the process is exactly the same as sending any other topup.

Note, There are two types of email domains that are allowed for Nauta Cuba Top-up : ```@nauta.com.cu```
and ```@nauta.co.cu```

```swift

ReloadlyAirtime.shared.sendTopupsRequest(operatorId: 701, amount: 1.0, useLocalAmount: true, customIdentifier: "customID", recipientEmail: "mail@nauta.com.cu", senderPhone: Phone(number: "+13059547862", countryCode: "US")) { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }

```
