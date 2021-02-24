import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var illnessWebView: WKWebView!
    
    @IBOutlet weak var suicideButton: UIButton!
    @IBOutlet weak var anxietyButton: UIButton!
    @IBOutlet weak var depressionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        rightSwipeGesture.direction = .right
        view.addGestureRecognizer(rightSwipeGesture)
    }
    
    
    func openURLInWebView(stringURL: String) {
        if let URL = URL(string: stringURL) {
                illnessWebView.load(URLRequest(url: URL))
            }
    }
    
    
    @IBAction func depressionButtonPressed(_ sender: Any) {
        depressionButton.isSelected = true
        anxietyButton.isSelected = false
        suicideButton.isSelected = false
        openURLInWebView(stringURL: "https://www.who.int/news-room/fact-sheets/detail/depression")
    }
    
    @IBAction func anxietyButtonPressed(_ sender: Any) {
        depressionButton.isSelected = false
        anxietyButton.isSelected = true
        suicideButton.isSelected = false
        openURLInWebView(stringURL: "https://www.paho.org/en/noncommunicable-diseases-and-mental-health/noncommunicable-diseases-and-mental-health-data-portal-2")
    }
    
    @IBAction func suicideButtonPressed(_ sender: Any) {
        depressionButton.isSelected = false
        anxietyButton.isSelected = false
        suicideButton.isSelected = true
        openURLInWebView(stringURL: "https://www.who.int/health-topics/suicide#tab=tab_2")
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
