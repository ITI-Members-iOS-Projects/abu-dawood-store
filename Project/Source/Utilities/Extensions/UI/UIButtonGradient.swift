//
//  UIButtonGradient.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/19/24.
//

import Foundation
import UIKit

@IBDesignable
class GradientButton: CairoButtonSemiBold {
    private let gradientLayer = CAGradientLayer()
    
    @IBInspectable var startColor: UIColor = .blue {
        didSet {
            updateGradientColors()
        }
    }
    
    @IBInspectable var endColor: UIColor = .green {
        didSet {
            updateGradientColors()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradient() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func updateGradientColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
}
