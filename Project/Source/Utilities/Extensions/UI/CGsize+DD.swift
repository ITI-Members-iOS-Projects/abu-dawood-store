//
//  CGsize+DD.swift
//  DD-UIExtensions
//
//  Created by Mohamed Gamal on 8/27/18.
//
import UIKit

public extension CGSize {
    
    static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
    
    static func += (lhs: inout CGSize, rhs: CGSize) {
        lhs.width += rhs.width
        lhs.height += rhs.height
    }
    
    static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
    
    static func -= (lhs: inout CGSize, rhs: CGSize) {
        lhs.width -= rhs.width
        lhs.height -= rhs.height
    }
    
    static func * (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width * rhs.width, height: lhs.height * rhs.height)
    }
    
    static func *= (lhs: inout CGSize, rhs: CGSize) {
        lhs.width *= rhs.width
        lhs.height *= rhs.height
    }
}
