//
//  LoginNetworkAbstruction.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import Foundation

// Ideally this should represent a type of class/struct
typealias SigninInformation = Any
protocol LoginNetworkAbstruction {
    func login(with email: String, and password: String, completion: @escaping(Bool, SigninInformation)-> Void)
}

// Ideally this should represent a type of class/struct
typealias OTPInformation = Any
protocol ForgotPasswordNetworkAbstruction {
    func sendOTP(to email: String, completion: @escaping(Bool, OTPInformation)-> Void)
    func resendOTP(to email: String, completion: @escaping(Bool, OTPInformation)-> Void)
    func resetTo(new password: String, completion: @escaping(Bool)-> Void)
}

extension ForgotPasswordNetworkAbstruction {
    func resendOTP(to email: String, completion: @escaping(Bool, OTPInformation)-> Void) {
        self.sendOTP(to: email, completion: completion)
    }
}
