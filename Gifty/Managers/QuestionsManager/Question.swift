import Foundation

enum QuestionNumber {
    case one
    case twoOne
    case twoTwo
    case threeOne
    case threeTwo
    
    var isLastQuestion: Bool {
        switch self {
        case .twoOne,
                .threeOne,
                .threeTwo:
            return true
        default:
            return false
        }
    }
    
    var navigationState: NavigationState {
        switch self {
        case .one:
            return .firstQuestion
        case .twoOne:
            return .lastQuestion
        case .twoTwo:
            return .middleQuestion
        case .threeOne:
            return .lastQuestion
        case .threeTwo:
            return .lastQuestion
        }
    }
}

struct Question {
    var question: String
    var answers: [String]
    var containOpenAnswer: Bool
    var questionNumber: QuestionNumber
}
