//
//  ApiService.swift
//  TWIterationOne
//
//  Created by Karthi on 20/12/19.
//  Copyright © 2019 Karthi. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    func loadJson(filename fileName: String, completion: @escaping((Any?, Error?) -> ())) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Model].self, from: data)
                completion(jsonData, nil)
                return
            } catch {
                print("error:\(error)")
            }
        }
        completion(nil, nil)
    }
}

