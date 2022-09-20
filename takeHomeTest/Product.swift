//
//  ProductModel.swift
//  takeHomeTest
//
//  Created by Hannatassja Hardjadinata on 19/09/22.
//

import Foundation

struct Items: Decodable {
    var items: [Product]
}

struct Product: Codable {
    var id: Int
    var title: String
    var price: Float
    var description: String
    var category: String
    var image: String
    var rating: Rating
}

struct Rating: Codable {
    var rate: Float
    var count: Float
}
