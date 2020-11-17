//
//  Article.swift
//  GoodNews
//
//  Created by SujitAmin on 17/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

// MARK: - ArticleListModel
struct ArticleList: Codable {
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let title, articleDescription: String?

    enum CodingKeys: String, CodingKey {
        case title
        case articleDescription = "description"
    }
}
