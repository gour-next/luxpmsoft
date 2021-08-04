//
//  AMForgotPasswordBaseViewModel.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import Foundation

class AMForgotPasswordBaseViewModel: BaseViewModel {
    
    var networkFetch: ForgotPasswordNetworkAbstruction? = nil
    
    func initiate() {
        // set networkFetch to some client like
        self.networkFetch = FakeNetworkClient()
    }
    
    func validateInput(_ text: String) -> Bool {
        return true
    }
    
    func submitted(_ text: String, completion: @escaping(Bool)-> Void) {
        
    }
}
