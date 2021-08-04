//
//  PasswordValidable.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import Foundation

protocol PasswordValidable {
    /// Check if password is valid or not
    /// - Parameter password: <#password description#>
    func isValid(password: String) -> Bool
}

extension PasswordValidable {
    func isValid(password: String) -> Bool {
        // Write code to validate given password
        return true
    }
}
