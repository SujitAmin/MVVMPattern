//
//  ArticleListViewModel.swift
//  GoodNews
//
//  Created by SujitAmin on 17/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    let articles : [Article]
    
    func getNumberOfSection() -> Int {
        return 1;
    }
    
    func numberOfRowsInSection() -> Int {
        return articles.count;
    }
    
    func articleAtIndexPath(_ index : Int) -> ArticleViewModel {
        let article = articles[index];
        return ArticleViewModel(article);
    }
    
}


