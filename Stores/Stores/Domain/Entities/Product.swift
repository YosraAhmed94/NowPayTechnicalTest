//
//  Photo.swift
//  Stores
//
//  Created by Yousra Ahmed on 25/12/2021.
//

import Foundation
import UIKit

struct Product {
    let name: String
    var thumbnail: UIImage?
    var largeImage: UIImage?
    let price:Int
}
// MARK: - Welcome
struct Welcome: Codable {
    let photos: Photos
    let stat: String
}

// MARK: - Photos
struct Photos: Codable {
    let page, pages, perpage, total: Int
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
}


struct ProductList: Codable {

    let category: String
    let searchResults: [Photo]
}
