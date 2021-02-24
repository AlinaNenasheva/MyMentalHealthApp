import Foundation

enum SurveyResult {
    case none
    case mild
    case serve
}

class Profile {
    static let sharedInstance = Profile()
    private var screenings = [SurveyResult : Screening]()
    
    func getListOfScreenings() -> [SurveyResult : Screening] {
        return screenings
    }
    
    func appendScreening(result: SurveyResult, screening: Screening) {
        screenings[result] = screening
    }
}
