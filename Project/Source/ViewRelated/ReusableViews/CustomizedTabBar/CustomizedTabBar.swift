//
//  CustomizedTabBar.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/21/24.
//

import UIKit

final class CustomizedTabBar: NibLoadingView {
    
    @IBOutlet private weak var homeButton: CairoButtonSemiBold!
    @IBOutlet private weak var homeImageButton: UIButton!
    
    @IBOutlet private weak var categoryButton: CairoButtonSemiBold!
    @IBOutlet private weak var categoryImageButton: UIButton!
    
    @IBOutlet private weak var purchasesButton: CairoButtonSemiBold!
    @IBOutlet private weak var purchasesImageButton: UIButton!
    
    @IBOutlet private weak var moreButton: CairoButtonSemiBold!
    @IBOutlet private weak var moreImageButton: UIButton!
    
    private var cancellables = Set<AnyCancellable>()
    
    var homeButtonAction: PassthroughSubject<Void, Never> = .init()
    var categoryButtonAction: PassthroughSubject<Void, Never> = .init()
    var purchasesButtonAction: PassthroughSubject<Void, Never> = .init()
    var moreButtonAction: PassthroughSubject<Void, Never> = .init()
    
    private let shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        //        shapeLayer.cornerRadius = 20
        shapeLayer.fillColor = UIColor.white.cgColor
        return shapeLayer
    }()
    
    func configure() {
        // home Publisher
        homeButton.publisher(forEvent: .touchUpInside)
            .subscribe(homeButtonAction)
            .store(in: &cancellables)
        homeImageButton.publisher(forEvent: .touchUpInside)
            .subscribe(homeButtonAction)
            .store(in: &cancellables)
        
        // category Publisher
        categoryButton.publisher(forEvent: .touchUpInside)
            .subscribe(categoryButtonAction)
            .store(in: &cancellables)
        categoryImageButton.publisher(forEvent: .touchUpInside)
            .subscribe(categoryButtonAction)
            .store(in: &cancellables)
        
        // purchases Publisher
        purchasesButton.publisher(forEvent: .touchUpInside)
            .subscribe(purchasesButtonAction)
            .store(in: &cancellables)
        purchasesImageButton.publisher(forEvent: .touchUpInside)
            .subscribe(purchasesButtonAction)
            .store(in: &cancellables)
        
        // more Publisher
        moreButton.publisher(forEvent: .touchUpInside)
            .subscribe(moreButtonAction)
            .store(in: &cancellables)
        moreImageButton.publisher(forEvent: .touchUpInside)
            .subscribe(moreButtonAction)
            .store(in: &cancellables)
        
        changeSelectedIndex(selectedIndex: .none)
    }
    
}

extension CustomizedTabBar {
    func changeSelectedIndex(selectedIndex: TabBarSelectedIndex) {
        switch selectedIndex {
        case .none:
            homeButton.setTitleColor(.black, for: .normal)
            homeImageButton.setImage(UIImage(named: R.image.homePressed.name), for: .normal)
            
            categoryButton.setTitleColor(.grey969696, for: .normal)
            categoryImageButton.setImage(UIImage(named: R.image.categoryUnClicked.name), for: .normal)
            
            purchasesButton.setTitleColor(.grey969696, for: .normal)
            purchasesImageButton.setImage(UIImage(named: R.image.purchasesUnClicked.name), for: .normal)
        case .home:
            homeButton.setTitleColor(.black, for: .normal)
            homeImageButton.setImage(UIImage(named: R.image.homePressed.name), for: .normal)
            
            categoryButton.setTitleColor(.grey969696, for: .normal)
            categoryImageButton.setImage(UIImage(named: R.image.categoryUnClicked.name), for: .normal)
            
            purchasesButton.setTitleColor(.grey969696, for: .normal)
            purchasesImageButton.setImage(UIImage(named: R.image.purchasesUnClicked.name), for: .normal)
        case .category:
            homeButton.setTitleColor(.grey969696, for: .normal)
            homeImageButton.setImage(UIImage(named: R.image.homeUnClicked.name), for: .normal)
            
            categoryButton.setTitleColor(.black, for: .normal)
            categoryImageButton.setImage(UIImage(named: R.image.categoryPressed.name), for: .normal)
            
            purchasesButton.setTitleColor(.grey969696, for: .normal)
            purchasesImageButton.setImage(UIImage(named: R.image.purchasesUnClicked.name), for: .normal)
        case .purchases:
            homeButton.setTitleColor(.grey969696, for: .normal)
            homeImageButton.setImage(UIImage(named: R.image.homeUnClicked.name), for: .normal)
            
            categoryButton.setTitleColor(.grey969696, for: .normal)
            categoryImageButton.setImage(UIImage(named: R.image.categoryUnClicked.name), for: .normal)
            
            purchasesButton.setTitleColor(.black, for: .normal)
            purchasesImageButton.setImage(UIImage(named: R.image.purchasesPressed.name), for: .normal)
        }
    }
    
    enum TabBarSelectedIndex: String, CaseIterable {
        case none
        case home
        case category
        case purchases
    }
}

extension CustomizedTabBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateShapeLayer()
    }
    
    private func updateShapeLayer() {
        shapeLayer.frame = self.bounds
        shapeLayer.cornerRadius = 20
        self.applyCustomCurve(center: self.frame.width / 2, radius: 32)
    }
}

extension CustomizedTabBar {
    private func applyCustomCurve(center: CGFloat, radius curve: CGFloat) {
        let path = UIBezierPath.createCurve(at: center, radius: curve, on: self)
        shapeLayer.path = path.cgPath
        self.layer.sublayers?.removeAll(where: { $0 is CAShapeLayer })
        self.layer.insertSublayer(shapeLayer, at: 0)
    }
}

extension UIBezierPath {
    class func createCurve(at center: CGFloat, radius curve: CGFloat, on view: UIView) -> UIBezierPath {
        let path = UIBezierPath()
        let cornerRadius: CGFloat = 20
        let width = view.bounds.width
        let height = view.bounds.height
        
        // Move to the start point
        path.move(to: CGPoint(x: 0, y: cornerRadius))
        
        // Top-left corner
        path.addQuadCurve(to: CGPoint(x: cornerRadius, y: 0), controlPoint: .zero)
        
        // Top edge to the start of the curve
        path.addLine(to: CGPoint(x: center - (curve * 1.6), y: 0))
        
        // First part of the custom curve
        path.addQuadCurve(to: CGPoint(x: center - curve, y: curve / 1.4), controlPoint: CGPoint(x: center - curve - curve / 6, y: 0))
        
        // Second part of the custom curve
        path.addCurve(to: CGPoint(x: center + curve, y: curve / 1.4),
                      controlPoint1: CGPoint(x: center - curve + curve / 3, y: curve + curve / 1.4),
                      controlPoint2: CGPoint(x: center + curve - curve / 3, y: curve + curve / 1.4))
        
        // Third part of the custom curve
        path.addQuadCurve(to: CGPoint(x: center + (curve * 1.6), y: 0), controlPoint: CGPoint(x: center + curve + curve / 6, y: 0))
        
        // Top edge to the top-right corner
        path.addLine(to: CGPoint(x: width - cornerRadius, y: 0))
        
        // Top-right corner
        path.addQuadCurve(to: CGPoint(x: width, y: cornerRadius), controlPoint: CGPoint(x: width, y: 0))
        
        // Right edge
        path.addLine(to: CGPoint(x: width, y: height - cornerRadius))
        
        // Bottom-right corner
        path.addQuadCurve(to: CGPoint(x: width - cornerRadius, y: height), controlPoint: CGPoint(x: width, y: height))
        
        // Bottom edge
        path.addLine(to: CGPoint(x: cornerRadius, y: height))
        
        // Bottom-left corner
        path.addQuadCurve(to: CGPoint(x: 0, y: height - cornerRadius), controlPoint: CGPoint(x: 0, y: height))
        
        // Left edge
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))
        
        path.close()
        return path
    }
}
