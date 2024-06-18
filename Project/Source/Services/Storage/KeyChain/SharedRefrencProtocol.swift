//
//  SharedRefrencProtocol.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Foundation

protocol SharedRefrencProtocol {
    func set(_ value: String?, forKey key: KeychainKeys)
    func get(forKey key: KeychainKeys) -> String?

    func setElement<T: Codable>(_ element: T, forKey key: KeychainKeys)
    func getElement<T: Codable>(forKey key: KeychainKeys) -> T?

    func delete(forKey key: KeychainKeys)
}
