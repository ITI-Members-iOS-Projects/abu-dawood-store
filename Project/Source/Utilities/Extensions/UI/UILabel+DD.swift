//
//  UILabel+DD.swift
//
//
//  Created by Mohamed Gamal on 8/29/18.
//

import UIKit

public extension UILabel {
    
    convenience init(font: UIFont, color: UIColor, alignment: NSTextAlignment) {
        self.init()
        self.font = font
        self.textColor = color
        self.textAlignment = alignment
    }
    
    func lineSpace(_ lineSpace: CGFloat) {
        guard let text = self.text else {
            return
        }
        
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
    
    func estimatedSize(_ width: CGFloat = CGFloat.greatestFiniteMagnitude, height: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGSize {
        return sizeThatFits(CGSize(width: width, height: height))
    }
    
    func estimatedHeight() -> CGFloat {
        return sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)).height
    }
    
    func estimatedWidth() -> CGFloat {
        return sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)).width
    }
    
    func fitHeight() {
        self.height = estimatedHeight()
    }
    
    func fitWidth() {
        self.width = estimatedWidth()
    }
    
    func fitSize() {
        self.fitWidth()
        self.fitHeight()
        sizeToFit()
    }
    
    func check(touch: UITouch, isInRange targetRange: NSRange) -> Bool {
        let touchPoint = touch.location(in: self)
        let index = characterIndex(at: touchPoint)
        return NSLocationInRange(index, targetRange)
    }
    
    func characterIndex(at touchPoint: CGPoint) -> Int {
        guard let attributedString = attributedText else { return NSNotFound }
        if !bounds.contains(touchPoint) {
            return NSNotFound
        }
        
        let textRect = self.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        if !textRect.contains(touchPoint) {
            return NSNotFound
        }
        
        var point = touchPoint
        // Offset tap coordinates by textRect origin to make them relative to the origin of frame
        point = CGPoint(x: point.x - textRect.origin.x, y: point.y - textRect.origin.y)
        // Convert tap coordinates (start at top left) to CT coordinates (start at bottom left)
        point = CGPoint(x: point.x, y: textRect.size.height - point.y)
        
        let framesetter = CTFramesetterCreateWithAttributedString(attributedString)
        let suggestedSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, attributedString.length), nil, CGSize(width: textRect.width, height: CGFloat.greatestFiniteMagnitude), nil)
        
        let path = CGMutablePath()
        path.addRect(CGRect(x: 0, y: 0, width: suggestedSize.width, height: CGFloat(ceilf(Float(suggestedSize.height)))))
        
        let frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attributedString.length), path, nil)
        let lines = CTFrameGetLines(frame)
        let linesCount = numberOfLines > 0 ? min(numberOfLines, CFArrayGetCount(lines)) : CFArrayGetCount(lines)
        if linesCount == 0 {
            return NSNotFound
        }
        
        var lineOrigins = [CGPoint](repeating: .zero, count: linesCount)
        CTFrameGetLineOrigins(frame, CFRangeMake(0, linesCount), &lineOrigins)
        
        for (idx, lineOrigin) in lineOrigins.enumerated() {
            var lineOrigin = lineOrigin
            let lineIndex = CFIndex(idx)
            let line = unsafeBitCast(CFArrayGetValueAtIndex(lines, lineIndex), to: CTLine.self)
            
            // Get bounding information of line
            var ascent: CGFloat = 0.0
            var descent: CGFloat = 0.0
            var leading: CGFloat = 0.0
            let width = CGFloat(CTLineGetTypographicBounds(line, &ascent, &descent, &leading))
            let yMin = CGFloat(floor(lineOrigin.y - descent))
            let yMax = CGFloat(ceil(lineOrigin.y + ascent))
            
            // Apply penOffset using flushFactor for horizontal alignment to set lineOrigin since this is the horizontal offset from drawFramesetter
            let flushFactor = flushFactorForTextAlignment(textAlignment: textAlignment)
            let penOffset = CGFloat(CTLineGetPenOffsetForFlush(line, flushFactor, Double(textRect.size.width)))
            lineOrigin.x = penOffset
            
            // Check if we've already passed the line
            if point.y > yMax {
                return NSNotFound
            }
            // Check if the point is within this line vertically
            if point.y >= yMin {
                // Check if the point is within this line horizontally
                if point.x >= lineOrigin.x && point.x <= lineOrigin.x + width {
                    // Convert CT coordinates to line-relative coordinates
                    let relativePoint = CGPoint(x: point.x - lineOrigin.x, y: point.y - lineOrigin.y)
                    return Int(CTLineGetStringIndexForPosition(line, relativePoint))
                }
            }
        }
        
        return NSNotFound
    }
    
    func flushFactorForTextAlignment(textAlignment: NSTextAlignment) -> CGFloat {
        switch textAlignment {
        case .center:
            return 0.5
        case .right:
            return 1.0
        case .left, .natural, .justified:
            return 0.0
        @unknown default:
            return 0.0
        }
    }
}

public extension UILabel {
    func underlineText() {
        // Create an attributed string with underline attribute
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))

        // Apply the attributed string to the label
        self.attributedText = attributedString
    }
}
