//
//  CacheManager.swift
//  NewsApp
//
//  Created by Pratik Zora on 2020-10-09.
//

import Foundation

class CacheManager {
    
    static var imageDisctionary = [String:Data]()
    
    static func saveData (_ url:String, _ imageData:Data) {
        
        // Save the image data along with the URL
        imageDisctionary[url] = imageData
        
    }
    
    static func retrieveData(_ url:String) -> Data? {
        
        // Return the saved image data or nill
        return imageDisctionary[url]
        
    }
    
}
