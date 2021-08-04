//
//  AMOTPViewModel.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 04/08/21.
//

import Foundation

final class AMOTPViewModel: AMForgotPasswordBaseViewModel {
    
    // Ideally this email/OTP will be embded in object
    var email: String = ""
    var otp: String = ""
    
    var writtenOTP: String = ""
    
    override func validateInput(_ text: String) -> Bool {
        
        if text.isEmpty {
            self.alertCompletion?("Alert", "OTP field is empty.")
            return false
        }
        
        if self.isCorrect(text) == false {
            self.alertCompletion?("Alert", "Provided OTP is wrong.")
            return false
        }
        
        return true
    }
    
    func isCorrect(_ otp: String) -> Bool {
        // wriet your own logic here
        return true
    }
    
    
    override func submitted(_ text: String, completion: @escaping(Bool)-> Void) {
        completion(true)
    }
    
    func resendOTP(completion: @escaping(Bool)-> Void) {
        self.loaderCompletion?(true)
        self.networkFetch?.resendOTP(to: self.email, completion: { (isSuccess, info) in
            self.loaderCompletion?(false)
            if isSuccess {
                // show a toast that OTP resent again
            } else {
                self.alertCompletion?("Error", "Couldn't send OTP. Try again")
            }
            completion(isSuccess)
        })
    }
}
