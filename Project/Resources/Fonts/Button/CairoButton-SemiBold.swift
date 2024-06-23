//
//  CairoButton-SemiBold.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/13/24.
//

import Foundation
import UIKit

@IBDesignable
class CairoButtonSemiBold: UIButton {
    
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
        self.titleLabel?.font = R.font.cairoSemiBold.callAsFunction(size: fontSize)
//        self.titleLabel?.font = UIFont(fontname: "Cairo-SemiBold", fontSize: 4)
    }
    
}
