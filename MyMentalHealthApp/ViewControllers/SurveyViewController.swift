import UIKit

class SurveyViewController: UIViewController {

    @IBOutlet weak var surveyView: SurveyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func fillDepressionSurvey() {
        self.surveyView.surveyTitleLabel.text = "DEPRESSION SCREENING"
        self.surveyView.infoLabel.text = "Over the last 2 weeks, on how many days have you been bothered by any of the following problems?"
        self.surveyView.firstQuestionLabel.text = "Little interest or pleasure in doing things?"
        self.surveyView.secondQuestionLabel.text = "Feeling down, depressed or hopeless?"
    }
    
    
    func fillAnxietySurvey() {
        self.surveyView.surveyTitleLabel.text = "ANXIETY SCREENING"
        self.surveyView.infoLabel.text = "Over the last 2 weeks, on how many days have you been bothered by any of the following problems?"
        self.surveyView.firstQuestionLabel.text = "Little interest or pleasure in doing things?"
        self.surveyView.secondQuestionLabel.text = "Feeling down, depressed or hopeless?"
    }
    
    
    func fillSuicideSurvey() {
        self.surveyView.surveyTitleLabel.text = "SUICIDE SCREENING"
        self.surveyView.infoLabel.text = "Over the last 2 weeks, on how many days have you been bothered by any of the following problems?"
        self.surveyView.firstQuestionLabel.text = "Little interest or pleasure in doing things?"
        self.surveyView.secondQuestionLabel.text = "Feeling down, depressed or hopeless?"
    }
}
