//
//  Gift.swift
//  Gifty
//
//  Created by Oleksii Vasyliev on 01.11.2021.
//
//

import Foundation

enum Categories {
    case sports, travel, culture, music, food, drink
}

struct Gift {
    var title: String
    var category: Categories
    var author: String
    var time: String
    var price: String
    var picture: String
    var shortDescription: String
    var longDescription: String
}
