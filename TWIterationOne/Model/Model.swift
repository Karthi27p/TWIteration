//
//  Model.swift
//  TWIterationOne
//
//  Created by Karthi on 20/12/19.
//  Copyright © 2019 Karthi. All rights reserved.
//

import UIKit

class Model: Codable {
    var name: String?
    var price: String?
    var image: String?
    var offerPrice: String?
    var desc: String?
    var cachedImage: UIImage?
    var placeholderImage: UIImage?
    var pid: String?
    
    enum CodingKeys: CodingKey {
        case name
        case price
        case image
        case desc
        case offerPrice
        case pid
    }
    
    
    func setImage(completion: ((UIImage?) -> ())? = nil) {
        if let cachedImage = cachedImage {
            completion?(cachedImage)
        } else {
            guard let leadImageUrlString = image, leadImageUrlString.count != 0, let url = URL(string: leadImageUrlString) else {
                completion?(placeholderImage)
                return
            }
            ApiService.getImage(url: url) { [weak self] (data, error) in
                guard let strongSelf = self, let data = data as? Data else {
                    return
                }
                DispatchQueue.main.async {
                    strongSelf.cachedImage = UIImage(data: data)
                    completion?(strongSelf.cachedImage)
                }
            }
        }
    }
}


