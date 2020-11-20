//
//  Webservice.swift
//  GoodWeather
//
//  Created by Sujit Amin on 1/15/21.
//  Copyright © 2021 Sujit Amin. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import Network

//struct Resource<T> {
//    let url: URL
//    let parse: (Data) -> T?
//}
//
//final class Webservice {
//    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
//        URLSession.shared.dataTask(with: resource.url) { data, response, error in
//            if let data = data {
//                DispatchQueue.main.async {
//                     completion(resource.parse(data))
//                }
//            } else {
//                completion(nil)
//            }
//        }.resume()
//    }  
//}

final class HttpUtility {
    static func getApiData<T: Codable>(requestUrl : URL, decodingType : T.Type, completionHandler : ((T?, Error?) -> Void)?) {
        print("Type Of DecodingType : \(decodingType)")
        AF.request(requestUrl, method: .get).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        DispatchQueue.main.async {
                            completionHandler?(result, nil)
                        }
                    } catch let error {
                        DispatchQueue.main.async {
                            completionHandler?(nil , error);
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        completionHandler?(nil , response.error);
                    }
                }
                break;
            case .failure (let error):
                DispatchQueue.main.async {
                    completionHandler?(nil , error);
                }
                break;
            }
        }
    }
    
}
