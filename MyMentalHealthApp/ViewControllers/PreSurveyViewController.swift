import UIKit

class PreSurveyViewController: UIViewController {

    @IBOutlet weak var depressionButton: UIButton!
    @IBOutlet weak var anxietyButton: UIButton!
    @IBOutlet weak var suicideButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        rightSwipeGesture.direction = .right
        view.addGestureRecognizer(rightSwipeGesture)
        depressionButton.layer.cornerRadius = 10
        anxietyButton.layer.cornerRadius = 10
        suicideButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func depressionButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let surveyViewController = storyboard.instantiateViewController(identifier: String(describing: SurveyViewController.self)) as! SurveyViewController
        surveyViewController.fillDepressionSurvey()
        self.present(surveyViewController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func anxietyButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let surveyViewController = storyboard.instantiateViewController(identifier: String(describing: SurveyViewController.self)) as! SurveyViewController
        surveyViewController.fillAnxietySurvey()
        self.present(surveyViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func suicideButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let surveyViewController = storyboard.instantiateViewController(identifier: String(describing: SurveyViewController.self)) as! SurveyViewController
        surveyViewController.fillSuicideSurvey()
        self.present(surveyViewController, animated: true, completion: nil)
    }
    
    @objc func processSwipe(_ swipeGesture: UISwipeGestureRecognizer) {
         switch swipeGesture.direction {
         case .right:
            self.dismiss(animated: true)
         default:
             print("")
        }
    }
}
