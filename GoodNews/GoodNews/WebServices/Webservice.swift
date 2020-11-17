//
//  Webservice.swift
//  GoodNews
//
//  Created by SujitAmin on 17/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation


class Webservice {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
}
