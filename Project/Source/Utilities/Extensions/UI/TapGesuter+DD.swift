//
//  TapGesuter+DD.swift
//  
//
//  Created by Mohamed Gamal on 8/29/18.
//

import UIKit

open class TapGesture: UITapGestureRecognizer {
    
    private var tapAction: ((UITapGestureRecognizer) -> Void)?
    public var tapCount: Int = 1 {
        didSet {
            self.numberOfTapsRequired = tapCount
        }
    }
    public var fingerCount: Int = 1 {
        didSet {
            self.numberOfTouchesRequired = fingerCount
        }
    }
    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    public convenience init (
        tapCount: Int = 1,
        fingerCount: Int = 1,
        action: ((UITapGestureRecognizer) -> Void)?) {
        self.init()
        self.numberOfTapsRequired = tapCount
        self.numberOfTouchesRequired = fingerCount
        self.tapAction = action
        self.addTarget(self, action: #selector(TapGesture.didTap(_:)))
    }
    
    @objc open func didTap (_ tap: UITapGestureRecognizer) {
        tapAction? (tap)
    }
    
    public func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,y: locationOfTouchInLabel.y - textContainerOffset.y);
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
