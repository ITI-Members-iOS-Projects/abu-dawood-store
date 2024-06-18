//
//  NSAttributedString+DD.swift
//  DD-Foundation
//
//  Created by Mohamed Gamal on 8/29/18.
//

import UIKit

// MARK: - Properties

public extension NSAttributedString {
    var bolded: NSAttributedString {
        
        return applying(attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    var underlined: NSAttributedString {
        return applying(attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    var italicized: NSAttributedString {
        return applying(attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    var striked: NSAttributedString {
        return applying(attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int)])
    }
    
    var attributes: [NSAttributedString.Key: Any] {
        return attributes(at: 0, effectiveRange: nil)
    }
    
    func colored(with color: UIColor) -> NSAttributedString {
        return applying(attributes: [.foregroundColor: color])
    }
}

// MARK: - Methods

public extension NSAttributedString {
    
    fileprivate func applying(attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        copy.addAttributes(attributes, range: range)
        
        return copy
    }
    
    /// Apply attributes to substrings matching a regular expression
    func applying(attributes: [NSAttributedString.Key: Any], toRangesMatching pattern: String) -> NSAttributedString {
        guard let pattern = try? NSRegularExpression(pattern: pattern, options: []) else { return self }
        
        let matches = pattern.matches(in: string, options: [], range: NSRange(0..<length))
        let result = NSMutableAttributedString(attributedString: self)
        
        for match in matches {
            result.addAttributes(attributes, range: match.range)
        }
        
        return result
    }
    
    /// Apply attributes to occurrences of a given string
    func applying<T: StringProtocol>(attributes: [NSAttributedString.Key: Any], toOccurrencesOf target: T) -> NSAttributedString {
        let pattern = "\\Q\(target)\\E"
        
        return applying(attributes: attributes, toRangesMatching: pattern)
    }
    
    func hasFontAttribute() -> Bool {
        guard !self.string.isEmpty else { return false }
        let font = self.attribute(.font, at: 0, effectiveRange: nil) as? UIFont
        return font != nil
    }
    
    func copyWithParagraphAttribute(_ font: UIFont) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        paragraphStyle.alignment = .left
        paragraphStyle.lineSpacing = 0.0
        paragraphStyle.minimumLineHeight = font.lineHeight
        paragraphStyle.maximumLineHeight = font.lineHeight
        
        let copy = NSMutableAttributedString(attributedString: self)
        let range = NSRange(location: 0, length: copy.length)
        copy.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        copy.addAttribute(.baselineOffset, value: font.pointSize * 0.08, range: range)
        return copy
    }
    
    func copyWithAddedFontAttribute(_ font: UIFont) -> NSAttributedString {
        if !hasFontAttribute() {
            let copy = NSMutableAttributedString(attributedString: self)
            copy.addAttribute(.font, value: font, range: NSRange(location: 0, length: copy.length))
            return copy
        }
        return self.copy() as! NSAttributedString
    }
    
    func copyWithHighlightedColor() -> NSAttributedString {
        let alphaComponent = CGFloat(0.5)
        let baseColor: UIColor = (self.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor)?.withAlphaComponent(alphaComponent) ??
            UIColor.black.withAlphaComponent(alphaComponent)
        let highlightedCopy = NSMutableAttributedString(attributedString: self)
        let range = NSRange(location: 0, length: highlightedCopy.length)
        highlightedCopy.removeAttribute(.foregroundColor, range: range)
        highlightedCopy.addAttribute(.foregroundColor, value: baseColor, range: range)
        return highlightedCopy
    }
    
    func lines(for width: CGFloat) -> [CTLine] {
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        let frameSetterRef: CTFramesetter = CTFramesetterCreateWithAttributedString(self as CFAttributedString)
        let frameRef: CTFrame = CTFramesetterCreateFrame(frameSetterRef, CFRange(location: 0, length: 0), path.cgPath, nil)
        
        let linesNS: NSArray  = CTFrameGetLines(frameRef)
        let linesAO: [AnyObject] = linesNS as [AnyObject]
        let lines: [CTLine] = linesAO as! [CTLine]
        
        return lines
    }
    
    func text(for lineRef: CTLine) -> NSAttributedString {
        let lineRangeRef: CFRange = CTLineGetStringRange(lineRef)
        let range: NSRange = NSRange(location: lineRangeRef.location, length: lineRangeRef.length)
        return self.attributedSubstring(from: range)
    }
    
    func boundingRect(for width: CGFloat) -> CGRect {
        return self.boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude),
                                 options: .usesLineFragmentOrigin, context: nil)
    }
    
}
