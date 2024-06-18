//
//  UIScreen+DD.swift
//
//
//  Created by Mohamed Gamal on 8/30/18.
//

import UIKit

public extension UIScreen {
    
    static var screenWidth: CGFloat {
        if UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.portrait {
            
            return UIScreen.main.bounds.size.width
        }
        
        return UIScreen.main.bounds.size.height
    }
    
    static var screenHeight: CGFloat {
        
        if UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.portrait {
            
            return UIScreen.main.bounds.size.height
        }
        
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeightWithoutStatusBar: CGFloat {
        if UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.portrait {
            
            return UIScreen.main.bounds.size.height - screenStatusBarHeight
        }
        
        return UIScreen.main.bounds.size.width - screenStatusBarHeight
    }
    
    static var screenStatusBarHeight: CGFloat {
        
        return UIApplication.shared.statusBarFrame.height
    }
}
