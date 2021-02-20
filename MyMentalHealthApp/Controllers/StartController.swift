import Foundation
import Firebase
import FirebaseAuth

class StartController {
    
    private let startViewController = StartViewController()
    
    init() {
        startViewController.setLoginButtonHandler(signInUser(_:_:))
    }
    
    func signInUser(_ email: String, _ password: String) {
        
        let error = startViewController.validateFields()
        
        if error != nil {
            startViewController.showError(error!)
        }
        else {
            Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
                
                if err != nil {
                    self.startViewController.showError(err!.localizedDescription)
                }
                else {
                    self.startViewController.transitionToHome()
                }
            }
        }
    }
}
