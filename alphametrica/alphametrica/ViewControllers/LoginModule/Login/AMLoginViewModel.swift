//
//  AMLoginViewModel.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import Foundation

class AMLoginViewModel: BaseViewModel, EmailValidable, PasswordValidable {
    
    var networkFetch: LoginNetworkAbstruction? = nil
    
    /// Do assign some object or give anything default value. Setup here
    func initiate() {
        // set networkFetch to some client like
        self.networkFetch = FakeNetworkClient()
    }
    
    /// Validate input credential locally
    /// - Parameters:
    ///   - email: Written email
    ///   - password: Written password
    /// - Returns: Boolean 
    func validateInputCredential(_ email: String, and password: String) -> Bool {
        
        if email.isEmpty && password.isEmpty {
            self.alertCompletion?("Alert", "Please provide email and password.")
            return false
        }
        
        if email.isEmpty {
            self.alertCompletion?("Alert", "email field is empty.")
            return false
        }
        
        if password.isEmpty {
            self.alertCompletion?("Alert", "Password field is empty.")
            return false
        }
        
        if self.isValid(email: email) == false {
            self.alertCompletion?("Alert", "Provided email is invalid.")
            return false
        }
        
//        if self.isValid(password: password) == false {
//            self.alertCompletion?("Alert", "Provided password is invalid.")
//            return false
//        }
        
        return true
    }
    
    func login(with email: String, and password: String, completion: @escaping(Bool)-> Void) {
        self.loaderCompletion?(true)
        self.networkFetch?.login(with: email, and: password, completion: { (isSucess, information) in
            self.loaderCompletion?(false)
            // do some other task here
            if isSucess {
                self.alertCompletion?("Sucess", "Login Success")
            } else {
                self.alertCompletion?("Error", "Wrong credential")
            }
            completion(isSucess)
        })
    }
}
