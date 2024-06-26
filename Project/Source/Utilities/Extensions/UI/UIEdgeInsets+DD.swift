//
//  UIEdgeInsets+DD.swift
//  DD-UIExtensions
//
//  Created by Mohamed Gamal on 8/27/18.
//

import UIKit

extension UIEdgeInsets {
    
    enum InsetSide {
        case top
        case left
        case bottom
        case right
    }
    
    init(inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical/2, left: horizontal/2, bottom: vertical/2, right: horizontal/2)
    }
    
    func inset(side: InsetSide, by value : CGFloat) -> UIEdgeInsets {
        switch side
        {
            
        case .top:
            return UIEdgeInsets(top: self.top + value,
                                left: left,
                                bottom: bottom,
                                right: right)
        case .left:
            return UIEdgeInsets(top: top,
                                left: self.left + left,
                                bottom: bottom,
                                right: right)
        case .bottom:
            return UIEdgeInsets(top: top,
                                left: left,
                                bottom: self.bottom + bottom,
                                right: right)
        case .right:
            return UIEdgeInsets(top: top,
                                left: left,
                                bottom: bottom,
                                right: self.right + right)
        }
    }
    
}

public extension UIEdgeInsets {
    
    static func + (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: lhs.top + rhs.top, left: lhs.left + rhs.left, bottom: lhs.bottom + rhs.bottom, right: lhs.right + rhs.right)
    }
    
    static func += (lhs: inout UIEdgeInsets, rhs: UIEdgeInsets) {
        lhs.top += rhs.top
        lhs.left += rhs.right
        lhs.bottom += rhs.bottom
        lhs.right += rhs.right
    }
    
    static func - (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: lhs.top - rhs.top, left: lhs.left - rhs.left, bottom: lhs.bottom - rhs.bottom, right: lhs.right - rhs.right)
    }
    
    static func -= (lhs: inout UIEdgeInsets, rhs: UIEdgeInsets) {
        lhs.top -= rhs.top
        lhs.left -= rhs.right
        lhs.bottom -= rhs.bottom
        lhs.right -= rhs.right
    }
    
    static func * (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: lhs.top * rhs.top, left: lhs.left * rhs.left, bottom: lhs.bottom * rhs.bottom, right: lhs.right * rhs.right)
    }
    
    static func *= (lhs: inout UIEdgeInsets, rhs: UIEdgeInsets) {
        lhs.top *= rhs.top
        lhs.left *= rhs.right
        lhs.bottom *= rhs.bottom
        lhs.right *= rhs.right
    }
}

public extension UIEdgeInsets {
    /// Initialize `UIEdgeInset` with value in the all directions.
    ///
    init(value: CGFloat) {
      self.init(top: value, left: value, bottom: value, right: value)
    }

}
