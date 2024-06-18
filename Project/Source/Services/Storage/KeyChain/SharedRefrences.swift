//
//  SharedRefrences.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Foundation

final class SharedRefrences {
    static let shared = SharedRefrences()
    private let keychain = KeychainSwift()
    
    private init() {}
}

extension SharedRefrences: SharedRefrencProtocol {

    public func set(_ value: String?, forKey key: KeychainKeys) {
        guard let value_ = value else {
            keychain.delete(key)
            return
        }
        keychain.set(value_, forKey: key)
    }

    public func get(forKey key: KeychainKeys) -> String? {
        return keychain.get(key)
    }

    public func setElement<T: Codable>(_ element: T, forKey key: KeychainKeys) {
        keychain.setElement(element, forKey: key)
    }

    public func getElement<T: Codable>(forKey key: KeychainKeys) -> T? {
        return keychain.getElement(key)
    }

    public func delete(forKey key: KeychainKeys) {
        keychain.delete(key)
    }
}
