//
//  ImageView+Utils.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/24/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit

extension UIImageView {
    func cacheImage(urlString: String) {
        let emptyImage = UIImage(named: "no-image")
        guard let url = URL(string: urlString) else {
            image = emptyImage
            return
        }
        
        // Check for image cache
        let imageCache = NSCache<AnyObject, AnyObject>()
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            image = imageFromCache
            return
        }
        
        // Get the image using URLSession
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async { [unowned self] in
                guard let data = data,
                      let imageToCache = UIImage(data: data) else {
                        self.image = emptyImage
                        return
                }
                
                imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                self.image = imageToCache
            }
        }.resume()
    }
}
