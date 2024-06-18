//
//  UINavigationController+DD.swift
//
//
//  Created by Ahmad medo on 12/01/2024.
//

import UIKit

extension UINavigationController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Adding swipe to pop viewController
        self.interactivePopGestureRecognizer?.isEnabled = true
        self.interactivePopGestureRecognizer?.delegate = self
        
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    
    //  Checking if the viewController is last, if not disable the gesture
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.viewControllers.count > 1 {
            return true
        }

        return false
    }
}
