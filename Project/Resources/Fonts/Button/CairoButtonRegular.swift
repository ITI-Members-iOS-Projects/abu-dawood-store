//
//  CairoButtonRegular.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/19/24.
//

import Foundation
import UIKit

@IBDesignable
class CairoButtonRegular: UIButton {
    
    @IBInspectable var fontSize: CGFloat = 12 {
        didSet {
            updateView()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateView()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
        
    }
    private func updateView() {
        self.titleLabel?.font = R.font.cairoRegular.callAsFunction(size: fontSize)
    }
    
}
