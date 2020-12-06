//
//  File.swift
//  
//
//  Created by Jesse on 2020/12/06.
//

import UIKit

protocol JesseImageCache {
    subscript(_ url: URL) -> UIImage? { get set }
}

struct TemporaryImageCache: JesseImageCache {
    private let cache = NSCache<NSURL, UIImage>()
    
    subscript(_ key: URL) -> UIImage? {
        get { cache.object(forKey: key as NSURL) }
        set { newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL) }
    }
}
