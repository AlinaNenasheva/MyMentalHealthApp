import Foundation
import FirebaseAuth

class PasswordResetter {
    
    private let forgetPasswordViewController = ForgetPasswordViewController()
    
    init() {
        forgetPasswordViewController.setSubmitButtonHandler(resetPassword(_:))
    }
    
    func resetPassword(_ email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                self.forgetPasswordViewController.showError(error!.localizedDescription)
            }
        }
    }
}
