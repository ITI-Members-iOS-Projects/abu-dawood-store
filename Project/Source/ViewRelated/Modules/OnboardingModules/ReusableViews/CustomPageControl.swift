//
//  CustomPageControl.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/20/24.
//

import Foundation
import UIKit

@IBDesignable
class CustomPageControl: UIControl {
    // MARK: - Properties
    
    private var numberOfDots = [UIView]() {
        didSet {
            if numberOfDots.count == numberOfPages {
                setupViews()
            }
        }
    }
    
    @IBInspectable var numberOfPages: Int = 0 {
        didSet {
            numberOfDots.forEach { $0.removeFromSuperview() }
            numberOfDots.removeAll()
            for tag in 0..<numberOfPages {
                let dot = getDotView()
                dot.tag = tag
                dot.backgroundColor = pageIndicatorTintColor
                self.numberOfDots.append(dot)
            }
        }
    }
    
    @IBInspectable var currentPage: Int = 0 {
        didSet {
            print("CurrentPage is \(currentPage)")
        }
    }
    
    @IBInspectable var pageIndicatorTintColor: UIColor? = R.color.secondaryButtonColor.callAsFunction()
    @IBInspectable var currentPageIndicatorTintColor: UIColor? = R.color.gradient.callAsFunction()
    
    private lazy var stackView = UIStackView(frame: self.bounds)
    
    override var bounds: CGRect {
        didSet {
            self.numberOfDots.forEach { self.setupDotAppearance(dot: $0) }
        }
    }
    
    // MARK: - Helper methods
    
    private func getDotView() -> UIView {
        let dot = UIView()
        self.setupDotAppearance(dot: dot)
        dot.translatesAutoresizingMaskIntoConstraints = false
        return dot
    }
    
    private func setupDotAppearance(dot: UIView) {
        dot.transform = .identity
        dot.layer.cornerRadius = dot.bounds.height / 2
        dot.layer.masksToBounds = true
        if dot.tag == currentPage {
            setupCurrentPageControl(dot: dot)
        } else {
            dot.backgroundColor = pageIndicatorTintColor
        }
    }
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    init(withNoOfPages pages: Int) {
        self.numberOfPages = pages
        self.currentPage = 0
        super.init(frame: .zero)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    // MARK: - Setup views
    
    private func setupViews() {
        self.numberOfDots.forEach { self.stackView.addArrangedSubview($0) }
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
        
        self.numberOfDots.forEach { dot in
            NSLayoutConstraint.activate([
                dot.centerYAnchor.constraint(equalTo: self.stackView.centerYAnchor),
                dot.widthAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.4),
                dot.heightAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.4)
            ])
        }
        
    }
    
    // MARK: - Current Page Control
    private func setupCurrentPageControl(dot: UIView) {
        UIView.animate(withDuration: 0.2, animations: {
            dot.layer.cornerRadius = dot.bounds.height / 4
            dot.transform = CGAffineTransform(scaleX: 1.5, y: 1)
            dot.backgroundColor = self.currentPageIndicatorTintColor
        })
    }
    
}
