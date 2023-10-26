//
//  CacheManagers.swift
//  Airbnb
//
//  Created by Jason on 10/25/23.
//

import UIKit

final class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
