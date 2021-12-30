//
//  RemoteDataSource.swift
//  Shoe store
//
//  Created by Yousra Ahmed on 29/12/2021.
//

import Foundation
import UIKit

class ProductRemoteDataSource{
    //private let rest = RestManager()
    let apiKey = "3f89f93b763b23160e61b898f30fbceb"
    let URLString = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search")
    
    func fetchProducts(category: String, completion: @escaping ([Photo], Error?) -> Void){
        let URLString = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&text=\(category)&per_page=20&format=json&nojsoncallback=1")
        RestManager.rest.makeRequest(toURL: URLString!, withHttpMethod: .get){ (results) in
            if let data = results.data {
                //print(results.data)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let welcome = try? decoder.decode(Welcome.self, from: data) else { return }

                completion(welcome.photos.photo, nil)
            }
            else if let response = results.response {
                for (key, value) in response.headers.allValues() {
                    print(key, value)
                }
            }
            
            //print("\n\nResponse HTTP Headers:\n")
            
            
        }
    }
    
}
