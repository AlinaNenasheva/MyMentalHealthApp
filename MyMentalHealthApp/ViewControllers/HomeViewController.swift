import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var accessScreeningButton: UIButton!
    @IBOutlet weak var reviewScreening: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessScreeningButton.layer.cornerRadius = 10
        reviewScreening.layer.cornerRadius = 10
        reviewScreening.layer.borderWidth = 2
        reviewScreening.layer.borderColor = UIColor.green.cgColor
    }
    
    
    @IBAction func accessScreeningButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let preSurveyViewController = storyboard.instantiateViewController(identifier: String(describing: PreSurveyViewController.self)) as! PreSurveyViewController
        self.present(preSurveyViewController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func reviewScreeningButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let surveyViewController = storyboard.instantiateViewController(identifier: String(describing: SurveyViewController.self)) as! SurveyViewController
        self.present(surveyViewController, animated: true, completion: nil)
    }
}
