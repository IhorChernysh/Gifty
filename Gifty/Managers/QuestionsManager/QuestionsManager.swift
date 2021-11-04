import UIKit

enum NavigationState {
    case firstQuestion
    case middleQuestion
    case lastQuestion
    
    var title: String {
        switch self {
        case .firstQuestion:
            return "Next"
        case .middleQuestion:
            return "Next"
        case .lastQuestion:
            return "Finish"
        }
    }
    
    var leftImage: UIImage? {
        switch self {
        case .firstQuestion:
            return UIImage(named: "closeButton")
        case .middleQuestion,
                .lastQuestion:
            return UIImage(named: "back")
        }
    }
}

class QuestionsManager {
    
    // MARK: - Properties
    
    static let shared = QuestionsManager()
    
    private(set) var questions: [Question] = []
    private(set) var userAnswer = UserAnswer()
    
    private(set) var currentQuestionNumber: QuestionNumber = .one
    
    private(set) var currentUser = User()
    
    private init() {}
    
    // MARK: - Methods
    
    func resetQuestionsManager() {
        userAnswer = UserAnswer()
        currentQuestionNumber = .one
        currentUser = User()
    }
    
    func setupUserInfo(name: String, age: Int, gender: String) {
        currentUser.name = name
        currentUser.age = age
        currentUser.gender = gender
    }
    
    func saveUserInfoAndActivity() {
        var activityName = ""
        switch currentQuestionNumber {
        case .twoOne:
            if userAnswer.likeLearning == true {
                activityName = PreferActivity.travel.rawValue
            } else {
                activityName = PreferActivity.sports.rawValue
            }
        case .threeOne:
            if userAnswer.payAttentionFor == AttentionFor.movie {
                activityName = PreferActivity.culture.rawValue
            } else {
                activityName = PreferActivity.music.rawValue
            }
        case .threeTwo:
            if userAnswer.barOrRestaurant == BarOrRestaurant.restaurant {
                activityName = PreferActivity.food.rawValue
            } else {
                activityName = PreferActivity.drink.rawValue
            }
        default:
            return
        }

        
        currentUser.preferActivity = activityName
        CoreDataService.shared.addUser(user: currentUser)
    }
    
    func getCurrentQuestion() -> Question? {
        let currentQuestion = questions.first { $0.questionNumber == currentQuestionNumber }
        
        return currentQuestion
    }
    
    func setNextQuestion() {
        switch currentQuestionNumber {
        case .one:
            guard let personIsActive = userAnswer.personIsActive else {
                return
            }
            currentQuestionNumber = personIsActive ? .twoOne : .twoTwo
        case .twoOne:
            currentQuestionNumber = .twoOne
        case .twoTwo:
            if userAnswer.preferVisitPlace?.rawValue == PlaceToVisit.barRestaurant.rawValue {
                currentQuestionNumber = .threeTwo
            } else {
                currentQuestionNumber = .threeOne
            }
        case .threeOne:
            currentQuestionNumber = .threeOne
        case .threeTwo:
            currentQuestionNumber = .threeTwo
        }
    }
    
    func setPreviousQuestion() {
        switch currentQuestionNumber {
        case .one:
            currentQuestionNumber = .one
        case .twoOne:
            currentQuestionNumber = .one
        case .twoTwo:
            userAnswer.preferVisitPlace = nil
            currentQuestionNumber = .one
        case .threeOne:
            userAnswer.payAttentionFor = nil
            currentQuestionNumber = .twoTwo
        case .threeTwo:
            userAnswer.barOrRestaurant = nil
            currentQuestionNumber = .twoTwo
        }
    }
    
    func getNavigationState() -> NavigationState {
        return currentQuestionNumber.navigationState
    }
    
    func currentQuestionIsLast() -> Bool {
        return currentQuestionNumber.isLastQuestion
    }
    
    func updateSelectedAnswer(selectedAnswerName: String) {
        switch currentQuestionNumber {
        case .one:
            if let currentBoolAnswer = BoolAnswer(rawValue: selectedAnswerName) {
                userAnswer.personIsActive = currentBoolAnswer == .yes
            }
        case .twoOne:
            if let currentBoolAnswer = BoolAnswer(rawValue: selectedAnswerName) {
                userAnswer.likeLearning = currentBoolAnswer == .yes
            }
        case .twoTwo:
            if let currentPlaceToVisit = PlaceToVisit(rawValue: selectedAnswerName) {
                userAnswer.preferVisitPlace = currentPlaceToVisit
            }
        case .threeOne:
            if let currentAttentionFor = AttentionFor(rawValue: selectedAnswerName) {
                userAnswer.payAttentionFor = currentAttentionFor
            }
        case .threeTwo:
            if let currentBarOrRestaurant = BarOrRestaurant(rawValue: selectedAnswerName) {
                userAnswer.barOrRestaurant = currentBarOrRestaurant
            }
        }
    }
    
    func getSelectedAnswerNameBy(indexPath: IndexPath) -> String? {
        switch currentQuestionNumber {
        case .one:
            if let userIsActive = userAnswer.personIsActive,
               let currentBoolAnswer = BoolAnswer(rawValue: userIsActive ? BoolAnswer.yes.rawValue : BoolAnswer.no.rawValue) {
                return currentBoolAnswer.rawValue
            }
        case .twoOne:
            if let userLikeLearning = userAnswer.likeLearning,
               let currentBoolAnswer = BoolAnswer(rawValue: userLikeLearning ? BoolAnswer.yes.rawValue : BoolAnswer.no.rawValue) {
                return currentBoolAnswer.rawValue
            }
        case .twoTwo:
            if let preferVisitPlace = userAnswer.preferVisitPlace {
                return preferVisitPlace.rawValue
            }
        case .threeOne:
            if let payAttentionFor = userAnswer.payAttentionFor {
                return payAttentionFor.rawValue
            }
        case .threeTwo:
            if let barOrRestaurant = userAnswer.barOrRestaurant {
                return barOrRestaurant.rawValue
            }
        }
        
        return nil
    }
    
    func setAllQuestions() {
        questions = [Question(question: "Is the person active?",
                              answers: [BoolAnswer.yes.rawValue, BoolAnswer.no.rawValue],
                              containOpenAnswer: false,
                              questionNumber: .one),
                     Question(question: "Does that person like learning or seeing new things?",
                              answers: [BoolAnswer.yes.rawValue, BoolAnswer.no.rawValue],
                              containOpenAnswer: false,
                              questionNumber: .twoOne),
                     Question(question: "Long day. Would that person go to the Cinema or Bar/Restaurant?",
                              answers: [PlaceToVisit.cinema.rawValue, PlaceToVisit.barRestaurant.rawValue],
                              containOpenAnswer: false,
                              questionNumber: .twoTwo),
                     Question(question: "Would the person pay attention to the movie frames or the sound track?",
                              answers: [AttentionFor.movie.rawValue, AttentionFor.sound.rawValue],
                              containOpenAnswer: false,
                              questionNumber: .threeOne),
                     Question(question: "What is more important? Bar or Restaurant?",
                              answers: [BarOrRestaurant.bar.rawValue, BarOrRestaurant.restaurant.rawValue],
                              containOpenAnswer: false,
                              questionNumber: .threeTwo)]
    }
}
