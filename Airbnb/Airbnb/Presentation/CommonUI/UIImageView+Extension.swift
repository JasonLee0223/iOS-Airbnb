//
//  UIImageView+Extension.swift
//  Airbnb
//
//  Created by Jason on 10/25/23.
//

import UIKit

extension UIImageView {
    
    func setImageURL(imageName: String) -> UIImage? {
        /// Cache 객체의 Key 값으로 사용할 String
        let cacheKey = NSString(string: imageName)
        
        /// Cache된 이미지가 존재하면 그 이미지를 사용 (API 호출안하는 형태)
        if let cacheImage = ImageCacheManager.shared.object(forKey: cacheKey) {
            self.image = cacheImage
            return cacheImage
        }
        return nil
    }
}
