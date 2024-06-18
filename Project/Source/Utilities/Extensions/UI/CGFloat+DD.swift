//
//  CGFloat.swift
//  UI-DD
//
//  Created by Mohamed Gamal on 9/4/18.
//

import UIKit

public extension CGFloat {
    
    var degreesToRadians: CGFloat {
        return .pi * self / 180.0
    }
    
    /// checks small devices
    static var isSmallWidth: Bool { screenWidth <= 400 }
    /// gets screen width to use dynamic size views
    static var screenWidth: CGFloat { UIApplication.screenWidth }
    /// calculates value based on screen width
    static func dynamicToWidth(_ value: CGFloat) -> CGFloat {
        value * screenWidth / 430
    }
}
