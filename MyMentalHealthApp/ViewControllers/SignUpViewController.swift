import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmedPasswordTextField: UITextField!
    
    private var signUpButtonHandler: ((String, String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 20
        passwordTextField.isSecureTextEntry = true
        confirmedPasswordTextField.isSecureTextEntry = true
    }
    
    @IBAction func toLoginButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginPasswordViewController = storyboard.instantiateViewController(identifier: String(describing: StartViewController.self)) as! StartViewController
        self.present(loginPasswordViewController, animated: true, completion: nil)
    }
    
    func validateFields() -> String? {
        
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || confirmedPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Please fill in all fields."
        }
                
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}").evaluate(with: cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        if passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == confirmedPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
            
            return "Please make sure lines in 'password' and 'confirm password' text fields match."
        }
        return nil
    }
    
    func transitionToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainMenuViewController = storyboard.instantiateViewController(identifier: String(describing: HomeViewController.self)) as! HomeViewController
        self.present(mainMenuViewController, animated: true, completion: nil)
        
    }
    
    func showError(_ message:String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            self.emailTextField.text = nil
            self.passwordTextField.text = nil
            self.confirmedPasswordTextField.text = nil
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setSignUpButtonHandler(_ handler: @escaping (String, String) -> ()) {
        signUpButtonHandler = handler
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        if let error = validateFields() {
            showError(error)
        }
        signUpButtonHandler?(emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines), emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
    
    
    
}
