//
//  AMNewPasswordViewModel.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import Foundation

final class AMNewPasswordViewModel: AMForgotPasswordBaseViewModel, PasswordValidable {
    
    var email: String = ""
    
    override func validateInput(_ text: String) -> Bool {
        
        if text.isEmpty {
            self.alertCompletion?("Alert", "Password field is empty.")
            return false
        }
        
        if self.isValid(password: text) == false {
            self.alertCompletion?("Alert", "Provided password is invalid.")
            return false
        }
        
        return true
    }
    
    override func submitted(_ text: String, completion: @escaping (Bool) -> Void) {
        let password = text
        self.loaderCompletion?(true)
        self.networkFetch?.resetTo(new: password, completion: { isSuccess in
            self.loaderCompletion?(false)
            if isSuccess {
//                self.alertCompletion?("Success", "New password sucessfully changed.")
            } else {
                self.alertCompletion?("Try again", "Some error occured. Please try again.")
            }
            completion(isSuccess)
        })
    }
}
