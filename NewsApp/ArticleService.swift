//
//  ArticleService.swift
//  NewsApp
//
//  Created by Pratik Zora on 2020-10-06.
//

import Foundation

struct ArticleService : Decodable {
    
    var totalResults:Int?
    var articles:[Article]?
}
