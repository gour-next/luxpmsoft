//
//  FakeNetworkClient.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import Foundation
///This is fake network client.
struct FakeNetworkClient: LoginNetworkAbstruction, ForgotPasswordNetworkAbstruction {
    func login(with email: String, and password: String, completion: @escaping(Bool, SigninInformation)-> Void) {
        
        let credential = FakeCredential()
        
        if credential.email == email && credential.password == password {
            completion(true, "dummy info")
        } else {
            completion(false, "some other error info")
        }
        
    }
    
    func sendOTP(to email: String, completion: @escaping(Bool, OTPInformation)-> Void) {
        completion(true, "dummy text ")
    }
    func resetTo(new password: String, completion: @escaping(Bool)-> Void) {
        completion(true)
    }
}
