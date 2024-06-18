//
//  Dictionary+DD.swift
//  DD-Foundation
//
//  Created by Mohamed Gamal on 8/29/18.
//

import Foundation

public extension Dictionary {
    func has(_ key: Key) -> Bool {
        return index(forKey: key) != nil
    }
}
