//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by SujitAmin on 17/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation


struct ArticleViewModel {
    private let article : Article;
    
    init(_ article : Article) {
        self.article = article;
    }
    func getTitle() -> String{
        return self.article.title ?? "";
    }
    
    func getDescription() -> String {
        return self.article.articleDescription ?? "";
    }
//    var title: String {
//        return self.article.title
//    }
//
//    var description: String {
//        return self.article.description
//    }
}
