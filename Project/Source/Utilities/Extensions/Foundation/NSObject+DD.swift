//
//  NSObject+DD.swift
//  Foundation-DD
//
//  Created by Mohamed Gamal on 9/6/18.
//

import Foundation

public extension NSObject {
    func printObject() {
        Swift.print(#line, self)
    }
}

/// NSObject: Helper Methods
///
public extension NSObject {
  
  /// Returns the receiver's classname as a string, not including the namespace.
  ///
  class var classNameWithoutNamespaces: String {
    return String(describing: self)
  }
    
}
