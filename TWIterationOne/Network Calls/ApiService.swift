//
//  ApiService.swift
//  TWIterationOne
//
//  Created by Karthi on 20/12/19.
//  Copyright © 2019 Karthi. All rights reserved.
//

import UIKit

enum JsonError: Error {
    case InvalidUrl(reason: String)
    case SerializationError(reason: String)
}

class ApiService: NSObject {
    static func loadJson(filename fileName: String, completion: @escaping((Any?, Error?) -> ())) {
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
    
    static func getDataFromApi <T> (requestUrl: URLRequest?, resultStruct: T.Type, completion: @escaping((Any?, Error?) -> ())) where T : Decodable {
        guard  let requestUrl = requestUrl else {
            completion(nil, JsonError.InvalidUrl(reason: "Invalid request"))
            return
        }
        URLSession.shared.dataTask(with: requestUrl.url!) { (data, response, error) in
            guard let data = data else {
                completion(nil, JsonError.SerializationError(reason: "Json serialization error"))
                return
            }
            do {
                let decodedJson = try JSONDecoder().decode(resultStruct, from: data)
                DispatchQueue.main.async {
                    completion(decodedJson, nil)
                }
            } catch {
                completion(nil, JsonError.SerializationError(reason: "Serialization Error"))
                return
            }
            }.resume()
    }
    
    static func getImage(url: URL, completion: @escaping((Any?, Error?) -> ())) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil, error!)
                return
            }
            
            DispatchQueue.main.async {
                completion(data, nil)
            }
            
            }.resume()
    }
}

