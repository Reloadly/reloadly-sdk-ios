# Authentication API

The implementation is based on the [Authentication API Docs](https://developers.reloadly.com/#authentication-api).

## Usage

Call an `ReloadlyAuthentication.shared.configure` instance by providing the Application credentials details (client id & secret) from
the [dashboard](https://www.reloadly.com/developers/api-settings).

Import ReloadlySDK
```swift
import ReloadlySDK
```
Initialise library at `AppDelegate`

```swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ReloadlyAuthentication.shared.configure(with: "NxhvFxDrXtX34VL1DLHsbQGLOPgE8qL9",
                                                clientSecret: "c7gcNR4dOIAlmalojV35okbq--tqqVhPPr2bvcsXlmKadewvaXdRSxENwfpyFywh",
                                                service: AuthenticationService(backendEnvironment: .sandbox))
        return true
    }
}
```

Access token will generade and refresh automaticaly during request any Reloadly SDK but if you need to manage access token you can use provided api calls:

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

### get accessToken from keychain if contains
```swift
  let token = ReloadlyAuthentication.shared.getAccessToken()
  print(token)
```

### Logging request & response

To enable API default logging please change log level at SDK initialization
Also you can switch between backendEnvironment for SDK, by default production

```swift
  ReloadlyAuthentication.shared.configure(with: "id",
                                              clientSecret: "secret",
                                              service: AuthenticationService(backendEnvironment: .sandbox),
                                              logLevel: .info)
```

## Customizing The API Client Instance

### Configuring Timeouts

Used to configure additional options, connect and read timeouts can be configured globally:

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
Also username and password can be nil to use proxy without credentials


### Request latency telemetry

By default, the library sends request latency telemetry to Reloadly. These numbers help Reloadly improve the overall latency of its API for all users.

You can disable this behavior if you prefer:

```swift
ReloadlyAuthentication.shared.configure(with: "id",
                                            clientSecret: "secret",
                                            service: AuthenticationService(backendEnvironment: .sandbox),
                                            logLevel: .info, useTelemetry: false)

```
