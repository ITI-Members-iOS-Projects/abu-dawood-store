//
//  ImageRepresentable.swift
//  
//
//  Created by Eslam Mohamed on 24/12/2023.
//  
//

import UIKit
// MARK: - ImageRepresentable
public protocol ImageRepresentable {
    var imageURL: String? { get }
    var placeholderImage: UIImage? { get }
}
