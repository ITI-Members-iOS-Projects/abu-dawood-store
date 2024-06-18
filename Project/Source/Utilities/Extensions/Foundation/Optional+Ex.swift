//
//  Optional+Ex.swift
//  DD-UIExtensions
//
//  Created by Ahmed Attalla on 09/01/2024.
//  Copyright © 2024 Desh and Dez. All rights reserved.
//

import Foundation

public extension Optional {
    var isNil: Bool {
        self == nil
    }
}


// MARK: - Optional<String> Extensions
public extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        isNil || self == ""
    }
}
