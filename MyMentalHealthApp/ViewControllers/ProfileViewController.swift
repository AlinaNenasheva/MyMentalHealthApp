import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userHistoryButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutButton.layer.cornerRadius = 10
        userHistoryButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func userHistoryButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let userHistoryViewController = storyboard.instantiateViewController(identifier: String(describing: UserHistoryViewController.self)) as! UserHistoryViewController
        self.present(userHistoryViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func aboutButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let aboutViewController = storyboard.instantiateViewController(identifier: String(describing: AboutViewController.self)) as! AboutViewController
        self.present(aboutViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startViewController = storyboard.instantiateViewController(identifier: String(describing: StartViewController.self)) as! StartViewController
        self.present(startViewController, animated: true, completion: nil)
    }
    
}
