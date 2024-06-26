//
//  UIFont+DD.swift
//  DD-UIExtensions
//
//  Created by Mohamed Gamal on 8/27/18.
//

import UIKit

public enum weight: String {
    case None = ""
    case Regular = "Regular"
    case Bold = "Bold"
    case DemiBold = "DemiBold"
    case Light = "Light"
    case UltraLight = "UltraLight"
    case Italic = "Italic"
    case Thin = "Thin"
    case Book = "Book"
    case Roman = "Roman"
    case Medium = "Medium"
    case MediumItalic = "MediumItalic"
    case CondensedMedium = "CondensedMedium"
    case CondensedExtraBold = "CondensedExtraBold"
    case SemiBold = "SemiBold"
    case BoldItalic = "BoldItalic"
    case Heavy = "Heavy"
}

public enum name: String {
    case HelveticaNeue
    case Helvetica
    case Futura
    case Menlo
    case Avenir
    case AvenirNext
    case Didot
    case AmericanTypewriter
    case Baskerville
    case Geneva
    case GillSans
    case SanFranciscoDisplay
    case Seravek
}
extension UIFont {
    
    public convenience init?(fontname: String , fontSize: CGFloat) {
        self.init(name:fontname, size:fontSize)
    }
    
    public class func Font(_ name: name, type: weight, size: CGFloat) -> UIFont? {
        let fontName = name.rawValue + "-" + type.rawValue
        if let font = UIFont(name: fontName, size: size) {
            return font
        }
        
        let fontNameNone = name.rawValue
        if let font = UIFont(name: fontNameNone, size: size) {
            return font
        }
        
        let fontNameRegular = name.rawValue + "-" + "Regular"
        if let font = UIFont(name: fontNameRegular, size: size) {
            return font
        }
        
        return nil
    }
}
