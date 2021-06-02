# Authentication API

The implementation is based on the [Authentication API Docs](https://developers.reloadly.com/#authentication-api).

## Usage

Call an `ReloadlyAuthentication.shared.configure` instance by providing the Application credentials details (client id & secret) from
the [dashboard](https://www.reloadly.com/developers/api-settings).

Import ReloadlySDK
```swift
import ReloadlySDK
```
Initialise the library using `AppDelegate`. You can set the `ClientId`, `SecretId` and `environment` in the plist file of your app. Just paste the following in your plist file:

```swift
<key>ReloadlySDKClientId</key>
<string>PUT_YOUR_RELOADLY_CLIENT_ID_HERE/string>
<key>ReloadlySDKSecretId</key>
<string>PUT_YOUR_RELOADLY_CLIENT_SECRET_HERE</string>
<key>ReloadlySDKEnvironment</key>
<string>sandbox</string>
```


```swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ReloadlyAuthentication.shared.configure()
        return true
    }
}
```

The access token will be generated and refreshed automaticaly during requests to Reloadly APIs. However, if you need to manage the access token yourself, you can make use of the provided api calls as shown below:

### Request new accessToken
```swift
    ReloadlyAuthentication.shared.requestAccessToken() { result in
          switch result {
          case .success(let token):
              print("\(token)")
          case .failure(let error):
              print(error)
          }
    }
```

### Get accessToken from keychain if one is available
```swift
  let token = ReloadlyAuthentication.shared.getAccessToken()
  print(token)
```

### Logging request & response

To enable API default logging at `info` level, please change log level during SDK initialization.
You can switch the backendEnvironment that the SDK integracts with; by default the prouction environment backend is used.

```swift
  ReloadlyAuthentication.shared.configure(service: AuthenticationService(backendEnvironment: .sandbox), logLevel: .info)
```

## Customizing The API Client Instance

### Configuring Timeouts

Connect and read timeouts can be configured globally:

```swift
  ReloadlyAuthentication.shared.setCustomTimeouts(readTimeout: 30.0, writeTimeout: 30.0)
```

### Proxy Configuration

```swift
  let proxyConfiguratorWithCredentials = ProxyConfigurator(hostUrl: "url", port: 8043, username: "username", password: "password")
  ReloadlyAuthentication.shared.configure(with: "id",
                                                clientSecret: "secret",
                                                service: AuthenticationService(backendEnvironment: .sandbox),
                                                logLevel: .info, proxyConfiguration: proxyConfiguratorWithCredentials)

```
Also username and password can be nil to use proxy without credentials. 
Note that, while providing the `clientId` and `clientSecret` is supported as shown below, it is generallly discouraged. Make use of the plist instead to specify the clientId and clientSecret.


### Request latency telemetry

By default, the library sends request latency telemetry to Reloadly. These numbers help Reloadly improve the overall latency of its API for all users.

You can disable this behavior if you prefer:

```swift
ReloadlyAuthentication.shared.configure(with: "id",
                                            clientSecret: "secret",
                                            service: AuthenticationService(backendEnvironment: .sandbox),
                                            logLevel: .info, useTelemetry: false)

```
