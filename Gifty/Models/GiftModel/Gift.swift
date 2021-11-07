import Foundation

enum Categories: String {
    case sports = "Sports"
    case travel = "Travel"
    case culture = "Culture, Arts, and Literature"
    case music = "Music"
    case food = "Food"
    case drink = "Drink"
}

struct Gift {
    var title: String
    var category: Categories
    var author: String
    var time: String
    var price: String
    var picture: String
    var shortDescription: String
    var longDescription: NSMutableAttributedString
}
