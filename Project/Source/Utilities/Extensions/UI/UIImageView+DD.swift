//
//  UIImageView+DD.swift
//  DD-UIExtensions
//
//  Created by Mohamed Gamal on 8/27/18.
//

import UIKit
import Kingfisher

// MARK: - properties

public extension UIImageView {
    
    var widthPixel : Int {
        get {
            return Int(self.image!.scale * self.image!.size.width)
        }
    }
    var hieghtPixel : Int {
        get {
            return Int(self.image!.scale * self.image!.size.height)
        }
    }
    @IBInspectable var imageTint: UIColor {
        get {
            return tintColor
        }
        set {
            self.image = self.image?.withRenderingMode(.alwaysTemplate)
            self.tintColor = newValue
        }
    }
}

// MARK: - Methods

public extension UIImageView {
    
    
    func showLoadingOnImage () {
        self.kf.indicatorType = .activity
    }
    
    func hideLoadingOnImage () {
        self.kf.indicatorType = .none
    }
    
    func changeImageColorTint(_ color : UIColor) {
        self.image = self.image!.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    func imageFromURL(fromURL url : String, placeHolder : UIImage?) {
        self.kf.setImage(with: URL(string: url), placeholder: placeHolder , options: [.cacheOriginalImage])
    }
    
    func imageFromURL(fromURL url : String, placeHolder : UIImage?, handler: @escaping  ((_ error : Error?) -> ())) {
        self.kf.setImage(with: URL(string: url), placeholder: placeHolder , options: [.cacheOriginalImage])
    }
    
    func setImage(with urlString: String,
                  placeholder: UIImage? = nil) {
        let url = URL(string: urlString)
        self.kf.setImage(with: url,
                         placeholder: placeholder,
                         options: [.transition(.fade(0.5))])
        
    }
    
    func blur(withStyle style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        addSubview(blurEffectView)
        clipsToBounds = true
    }
    
    func blurred(withStyle style: UIBlurEffect.Style = .light) -> UIImageView {
        let imgView = self
        imgView.blur(withStyle: style)
        return imgView
    }
}

public extension UIImageView {
    func setImage(representable: ImageRepresentable?) {
        setImage(with: representable?.imageURL ?? "", placeholder: representable?.placeholderImage)
    }
}
