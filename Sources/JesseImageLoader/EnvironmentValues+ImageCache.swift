//
//  File.swift
//  
//
//  Created by Jesse on 2020/12/06.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: JesseImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: JesseImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
