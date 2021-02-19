import Foundation

class Injector{
    init() {
        let startController = StartController()
        let signUpper = SignUpper()
        let passwordResetter = PasswordResetter()
        let facilitiesFinder = FacilitiesFinder()
    }
}
