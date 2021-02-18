import UIKit

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    private var submitButtonHandler: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 10 
    }
    
    @IBAction func toLoginButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginPasswordViewController = storyboard.instantiateViewController(identifier: String(describing: StartViewController.self)) as! StartViewController
        self.present(loginPasswordViewController, animated: true, completion: nil)
    }
    
    func showError(_ message:String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            self.emailTextField.text = nil
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setSubmitButtonHandler(_ handler: @escaping (String) -> ()) {
        submitButtonHandler = handler
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        submitButtonHandler?(emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
    
}
