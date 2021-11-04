import Foundation

enum PreferActivity: String {
    case sports = "Sports"
    case travel = "Travel"
    case culture = "Culture, Arts, and Literature"
    case music = "Music"
    case food = "Food"
    case drink = "Drink"
}

enum PlaceToVisit: String {
    case cinema = "Cinema"
    case barRestaurant = "Bar/Restaurant"
}

enum AttentionFor: String {
    case movie = "Movie"
    case sound = "Sooundtrack"
}

enum BarOrRestaurant: String {
    case bar = "Bar"
    case restaurant = "Restaurant"
}

enum BoolAnswer: String {
    case yes = "Yes"
    case no = "No"
}

struct UserAnswer {
    var personIsActive: Bool?
    var likeLearning: Bool?
    var preferVisitPlace: PlaceToVisit?
    var payAttentionFor: AttentionFor?
    var barOrRestaurant: BarOrRestaurant?
}
