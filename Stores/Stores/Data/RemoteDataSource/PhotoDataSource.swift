//
//  PhotoDataSource.swift
//  Stores
//
//  Created by Yousra Ahmed on 29/12/2021.
//

import Foundation

class PhotoDataSource {
    //private let rest = RestManager()
   // let apiKey = "3f89f93b763b23160e61b898f30fbceb"
    
    func fetchPhoto(photo: Photo, completion: @escaping (Data, Error?) -> Void){
        let URLString = URL(string: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_m.jpg")
        RestManager.rest.makeRequest(toURL: URLString!, withHttpMethod: .get){ (results) in
            
            if let data = results.data {
                completion(data,nil)
            }
            
            //print("\n\nResponse HTTP Headers:\n")
            
            else if let response = results.response {
                for (key, value) in response.headers.allValues() {
                    print(key, value)
                }
            }
        }
    }
    
}
