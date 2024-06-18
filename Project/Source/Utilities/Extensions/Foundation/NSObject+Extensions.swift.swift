//
//  NSObject+Extensions.swift.swift
//
//
//  Created by Mohamed Gamal on 17/12/2023.
//

import Foundation

public extension NSObject {
    /// Value that represents a className as a string value
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return String(describing: self)
    }
}
