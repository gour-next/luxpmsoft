//
//  AMForgotPasswordViewModel.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import Foundation

final class AMForgotPasswordViewModel: AMForgotPasswordBaseViewModel, EmailValidable {
    
    var otp = ""
    
    override func validateInput(_ text: String) -> Bool {
        
        if text.isEmpty {
            self.alertCompletion?("Alert", "email field is empty.")
            return false
        }
        
        if self.isValid(email: text) == false {
            self.alertCompletion?("Alert", "Provided email is invalid.")
            return false
        }
        
        return true
    }
    
    
    override func submitted(_ text: String, completion: @escaping(Bool)-> Void) {
        let email = text
        self.loaderCompletion?(true)
        self.networkFetch?.sendOTP(to: email, completion: { (isSuccess, information) in
            self.loaderCompletion?(false)
            completion(isSuccess)
        })
    }
}
