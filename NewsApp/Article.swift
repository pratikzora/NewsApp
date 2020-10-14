//
//  Article.swift
//  NewsApp
//
//  Created by Pratik Zora on 2020-10-06.
//

import Foundation

struct Article : Decodable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
}
