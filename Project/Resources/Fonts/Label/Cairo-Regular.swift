//
//  Cairo-Regular.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/13/24.
//

import Foundation
import UIKit

@IBDesignable
class CairoRegular: UILabel {
    
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
        self.font = R.font.cairoRegular.callAsFunction(size: fontSize)
    }
    
}
