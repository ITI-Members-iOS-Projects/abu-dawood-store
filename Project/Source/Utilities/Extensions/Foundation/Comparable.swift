//
//  Comparable.swift
//
//
//  Created by Ahmad medo on 12/01/2024.
//

import Foundation

extension Comparable {
    
    /// Check if value is between the provided minimum and maximum value
    /// - Parameters:
    ///   - minimum: minimum value
    ///   - maximum: maximum value
    /// - Returns: Self
    func clamped(toMinimum minimum: Self, maximum: Self) -> Self {
        assert(maximum >= minimum, "Maximum clamp value can't be higher than the minimum")
        if self < minimum {
            return minimum
        } else if self > maximum {
            return maximum
        } else {
            return self
        }
    }
}
