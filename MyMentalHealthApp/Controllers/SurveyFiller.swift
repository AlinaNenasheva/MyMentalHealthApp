import Foundation


class SurveyFiller {
    
    var screening = Screening()
    var surveyViewController = SurveyViewController()
    
    func addAnswer(number: Int) {
        screening.appendAnswer(answerNumber: number)
    }
    
    func fillSurvey() {
        if screening.checkToOverride() {
            let resultInPoints = screening.getAnswers().reduce(0, { x, y in
                x + y
            })
            let result: SurveyResult
            if resultInPoints < 10 {
                result = .none
            } else if resultInPoints > 10 && resultInPoints < 20 {
                result = .mild
            } else {
                result = .serve
            }
            Profile.sharedInstance.appendScreening(result: result, screening: screening)
        }
    }
}
