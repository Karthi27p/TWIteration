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
        return model?.price ?? ""
    }
    var productImage: String {
        return model?.image ?? ""
    }
}
