//
//  EmailValidable.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import Foundation

/// Email validation
protocol EmailValidable {
    /// Check if email is valid or not
    /// - Parameter email: <#email description#>
    func isValid(email: String) -> Bool
}

extension EmailValidable {
    func isValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
