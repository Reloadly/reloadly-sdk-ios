//
//  KeychainSwift.swift
//  reloadly-authentication
//
//  Created by Taras Markevych on 15.03.2021.
//

import Foundation

protocol KeyValueStorage {
    func get(key: String) -> OAuth2Token?
    func set(value: OAuth2Token?, key: String)
}

class Keychain: KeyValueStorage {

    func get(key: String) -> OAuth2Token? {
        let query = createKeychainQuery(forKey: key)
        query.setValue(kCFBooleanTrue, forKey: kSecReturnData as String)
        query.setValue(kCFBooleanTrue, forKey: kSecReturnAttributes as String)

        var result: CFTypeRef?
        let status = SecItemCopyMatching(query, &result)

        guard let dict = result as? NSDictionary,
            let data = dict.value(forKey: kSecValueData as String) as? Data,
            status == noErr
            else { return nil }
        return try? JSONDecoder().decode(OAuth2Token.self, from: data)
    }

    func set(value: OAuth2Token?, key: String) {
        let query = createKeychainQuery(forKey: key)
        let data = try? JSONEncoder().encode(value)

        let status = SecItemCopyMatching(query, nil)

        if status == noErr {
            if let data = data {
                _ = SecItemUpdate(query, NSDictionary(dictionary: [kSecValueData: data]))
            } else {
                _ = SecItemDelete(query)
            }
        } else {
            if let data = data {
                query.setValue(data, forKey: kSecValueData as String)
                _ = SecItemAdd(query, nil)
            }
        }
    }

    private func createKeychainQuery(forKey key: String) -> NSMutableDictionary {
        let result = NSMutableDictionary()
        result.setValue(kSecClassGenericPassword, forKey: kSecClass as String)
        result.setValue(service, forKey: kSecAttrService as String)
        result.setValue(key, forKey: kSecAttrAccount as String)
        result.setValue(kSecAttrAccessibleAfterFirstUnlock, forKey: kSecAttrAccessible as String)
        return result
    }

    private let service = "ReloadlyAuthentication"

}
