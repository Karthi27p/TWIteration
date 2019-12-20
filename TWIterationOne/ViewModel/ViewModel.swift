//
//  ViewModel.swift
//  TWIterationOne
//
//  Created by Karthi on 20/12/19.
//  Copyright © 2019 Karthi. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    var model: Model?
    var productName: String {
        return model?.name ?? ""
    }
    var productPrice: String {
        
        if((model?.offerPrice) != nil) {
            return model?.offerPrice ?? ""
        } else {
            return model?.price ?? ""
        }
        
    }
    
    var color: UIColor {
        if ((model?.offerPrice) != nil) {
            return UIColor.red
        } else {
            return UIColor.black
        }
    }
    
    var productImage: String {
        return model?.image ?? ""
    }
    
    var productId: String {
        return model?.pid ?? ""
    }
}
