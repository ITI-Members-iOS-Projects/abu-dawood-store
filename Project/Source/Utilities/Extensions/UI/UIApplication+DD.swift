//
//  UIApplication+DD.swift
//  DD-UIExtensions

//  Created by Ahmad medo on 29/12/2023.
//  

import UIKit

// MARK: - Methods
public extension UIApplication {
    
    private static var windowScene: UIWindowScene? {
        return shared.connectedScenes.first as? UIWindowScene
    }
    
    static var screenWidth: CGFloat {
        return windowScene?
            .screen
            .bounds
            .size
            .width ?? .zero
    }
    
    static var screenHeight: CGFloat {
        return windowScene?
            .screen
            .bounds
            .size
            .height ?? .zero
    }
}
