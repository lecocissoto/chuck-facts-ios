//
//  ImageView+Utils.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/24/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func cacheImage(urlString: String) {
        let url = URL(string: urlString)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data)
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                self.image = imageToCache
            }
        }.resume()
    }
}
