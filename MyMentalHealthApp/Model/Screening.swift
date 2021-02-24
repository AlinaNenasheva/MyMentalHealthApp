import Foundation

enum Title {
    case depression
    case suicide
    case anxiety
}

class Screening {
    private var answers = [Int]()
    
    func getAnswers() -> [Int] {
        return answers
    }
    
    func appendAnswer(answerNumber: Int) {
        answers.append(answerNumber)
    }
    
    func checkToOverride() -> Bool {
        return answers.count < 6
    }
}
