//
//  OnboardingCollectionViewCell.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/18/24.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var onboardingImage: UIImageView!
    
    // Initialization code
    func configure(image: String) {
        onboardingImage.image = UIImage(named: image)
    }
    
}
