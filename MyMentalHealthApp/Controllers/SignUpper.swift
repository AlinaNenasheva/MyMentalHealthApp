import Foundation
import FirebaseAuth
import Firebase

class SignUpper {
    
    private let signUpViewController = SignUpViewController()
    
    init() {
        signUpViewController.setSignUpButtonHandler(signUpUser(_:_:))
    }
    
    func signUpUser(_ email: String, _ password: String) {
        
        let error = signUpViewController.validateFields()
        
        if error != nil {
            signUpViewController.showError(error!)
        }
        else {
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil {
                    self.signUpViewController.showError("Error creating user")
                }
                else {
                    
                    let db = Firestore.firestore()
                    
                    db.collection("patients").addDocument(data: ["uid": result!.user.uid]) { (error) in
                        
                        if error != nil {
                            self.signUpViewController.showError("Error saving user data")
                        }
                    }
                    
                    self.signUpViewController.transitionToHome()
                }
            }
        }
    }
}
