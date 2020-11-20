//
//  Webservice.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 5/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil 
}

extension Resource {
    init(url: URL) {
        self.url = url 
    }
}

struct Webservice {
    static func getApiData<T: Codable>(requestUrl : URL, decodingType: T.Type ,completionHandler : ((T?, Error?) -> Void)? ) {
        AF.request(requestUrl, method: .get).validate().responseJSON { (response) in
            switch (response.result) {
            case .success:
                if let data = response.data {
                    do {
                        let result = try JSONDecoder().decode(decodingType, from: data)
                        completionHandler?(result, nil);
                    } catch let error {
                        completionHandler?(nil, error);
                    }
                } else {
                    completionHandler?(nil, response.error);
                }
                break;
            case .failure(let error):
                completionHandler?(nil, error)
                break;
            }
        }
    }
    static func postApiData<T: Codable>(requestUrl: URL, requestBody : Parameters, resultType : T.Type, completionHandler: @escaping (_ result : T? , _ error : Error?) -> Void) {
            AF.request(requestUrl,method: .post , parameters: requestBody, encoding: URLEncoding.default).validate().responseJSON { (response) in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let json = try JSONDecoder().decode(resultType, from: data)
                            completionHandler(json, nil);
                        } catch let error {
                            completionHandler(nil, error);
                        }
                    } else {
                        completionHandler(nil, response.error);
                    }
                    break;
                case .failure(let error):
                    completionHandler(nil, error);
                    break;
                }
            }
        }
    
}

    

