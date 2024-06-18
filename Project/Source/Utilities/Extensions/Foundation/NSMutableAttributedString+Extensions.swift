//
//  NSMutableAttributedString+Extensions.swift
//
//
//  Created by Mohamed Gamal on 17/12/2023.
//

import Foundation
import UIKit

public extension NSMutableAttributedString {
    func setColor(color: UIColor, forText stringValue: String, font: UIFont) {
        let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        self.addAttributes([.underlineStyle: NSUnderlineStyle.single.rawValue], range: range)
        
        let fontAttribute = [NSAttributedString.Key.font: font]
        self.addAttributes(fontAttribute, range: range)
    }
}
