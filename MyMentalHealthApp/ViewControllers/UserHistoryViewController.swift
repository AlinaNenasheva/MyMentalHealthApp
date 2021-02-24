import UIKit

class UserHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        screenings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ScreeningTableViewCell.self), for: indexPath) as? ScreeningTableViewCell
            else {
                return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ScreeningTableViewCell
            else {
                return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let surveyViewController = storyboard.instantiateViewController(identifier: String(describing: SurveyViewController.self)) as! SurveyViewController
        self.present(surveyViewController, animated: true, completion: nil)
    }

    @IBOutlet weak var tableView: UITableView!
    var screenings = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        rightSwipeGesture.direction = .right
        view.addGestureRecognizer(rightSwipeGesture)
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
