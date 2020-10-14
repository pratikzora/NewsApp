//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Pratik Zora on 2020-10-06.
//

import Foundation

protocol ArticleModelProtocol {
    
    func articleRetrieved(_ articles:[Article])
}

class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    
    func getArticles() {
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringUrl = "http://newsapi.org/v2/top-headlines?country=ca&category=general&apiKey=b302477e81384cd2af0684c5cce8c8d2"
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't nill
        guard url != nil else {
            print("Couldn't create")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do {
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articles = articleService.articles!
                    
                    // Pass is back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrieved(articles)
                    }
                   
                }
                catch {
                    
                    print("Error pasing the json")
                    
                } // End Do - Catch
                
            } // End if
            
        } // End Data Task
        
        // Start the data task
        dataTask.resume()
    }
}
