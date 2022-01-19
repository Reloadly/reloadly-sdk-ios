import XCTest
import ReloadlySDK
class AutenticationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        ReloadlyAuthentication.shared.configure(with: "NxhvFxDrXtX34VL1DLHsbQGLOPgE8qL9",
                                                clientSecret: "c7gcNR4dOIAlmalojV35okbq--tqqVhPPr2bvcsXlmKadewvaXdRSxENwfpyFywh",
                                                service: AuthenticationService(backendEnvironment: .airtimeSandbox))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRequestAccessToken() {
        testSetCustomTimeout()
        ReloadlyAuthentication.shared.requestAccessToken() { result in
            switch result {
            case .success(let token):
                XCTAssertNotNil(token)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func testSetCustomTimeout() {
        ReloadlyAuthentication.shared.setCustomTimeouts(readTimeout: 30.0, writeTimeout: 30.0)
    }
    
    
    func testWrongCredentialsForToken() {
        let proxy = ProxyConfigurator(hostUrl: "localhost", port: 80, username: "username", password: "password")
        ReloadlyAuthentication.shared.configure(with: "id",
                                                clientSecret: "id",
                                                service: AuthenticationService(backendEnvironment: .airtimeSandbox), logLevel: .debug, proxyConfiguration: proxy)
        ReloadlyAuthentication.shared.requestAccessToken() { result in
            switch result {
            case .success(let token):
                print(token)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
}
