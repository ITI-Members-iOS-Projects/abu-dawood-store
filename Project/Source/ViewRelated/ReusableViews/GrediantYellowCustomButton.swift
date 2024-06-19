//
//  GrediantYellowCustomButton.swift
//  Abu Dawood
//
//  Created by Abdallah ismail on 19/06/2024.
//

import UIKit

class YellowCustomButton: UIButton {

    // Custom initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    // Function to setup the button's appearance
    private func setupButton() {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.applyGradient(colors: [.customGold, .customYellow])
    }

    // Function to apply gradient
    private func applyGradient(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.layer.cornerRadius

        // Ensure the gradient resizes with the button
        gradientLayer.masksToBounds = true
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    // Ensure the gradient layer resizes with the button
    override func layoutSubviews() {
        super.layoutSubviews()
        if let gradientLayer = self.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.bounds
        }
    }
}
