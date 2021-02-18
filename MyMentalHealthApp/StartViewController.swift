import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var loginButtonHandler: ((String, String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
        passwordTextField.isSecureTextEntry = true
    }

    func validateFields() -> String? {
        
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            loginButton.isEnabled = false
            return "Please fill in all fields."
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
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpPasswordViewController = storyboard.instantiateViewController(identifier: String(describing: SignUpViewController.self)) as! SignUpViewController
        self.present(signUpPasswordViewController, animated: true, completion: nil)
    }
    
    @IBAction func forgetPasswordButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let forgetPasswordViewController = storyboard.instantiateViewController(identifier: String(describing: ForgetPasswordViewController.self)) as! ForgetPasswordViewController
        self.present(forgetPasswordViewController, animated: true, completion: nil)
    }
    
    func setLoginButtonHandler(_ handler: @escaping (String, String) -> ()) {
        loginButtonHandler = handler
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if let error = validateFields() {
            showError(error)
        }
        loginButtonHandler?(emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines), passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines))
    }
}


