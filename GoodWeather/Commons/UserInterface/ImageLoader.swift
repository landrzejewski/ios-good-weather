//
//  ImageLoader.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

import Foundation
import UIKit

final class ImageLoader {
    
    private static var cache = NSCache<NSString, UIImage>()
    
    func get(from urlString: String, callback: @escaping (UIImage?) -> ()) {
        let key = NSString(string: urlString)
        if let image = ImageLoader.cache.object(forKey: key) {
            callback(image)
            return
        }
        guard let url = URL(string: urlString) else {
            callback(nil)
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let imageData = data, let image = UIImage(data: imageData) else {
                callback(nil)
                return
            }
            ImageLoader.cache.setObject(image, forKey: key)
            callback(image)
        }.resume()
    }
    
}
