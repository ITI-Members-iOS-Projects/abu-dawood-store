//
//  OffersCollectionViewCell.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/29/24.
//

import UIKit

final class OffersCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var offerImageView: UIImageView!
    
    func configure(image: String) {
        offerImageView.image = UIImage(named: image)
    }

}
