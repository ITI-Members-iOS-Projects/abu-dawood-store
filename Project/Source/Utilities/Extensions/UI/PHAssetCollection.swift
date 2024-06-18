//
//  PHAssetCollection.swift
//
//
//  Created by Ahmad medo on 21/01/2024.
//

import UIKit
import Photos

public extension PHAssetCollection {
    
    var photosCount: Int {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "mediaType == %d", PHAssetMediaType.image.rawValue)
        let result = PHAsset.fetchAssets(in: self, options: fetchOptions)
        return result.count
    }
    
    func getCoverImgWithSize(_ size: CGSize) -> UIImage! {
        let assets = PHAsset.fetchAssets(in: self, options: nil)
        let asset = assets.firstObject
        return asset?.getOrginalImage()
    }
    
    func hasAssets() -> Bool {
        
        let assets = PHAsset.fetchAssets(in: self, options: nil)
        return assets.count > 0
    }
    
}
