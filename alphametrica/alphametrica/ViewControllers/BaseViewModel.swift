//
//  BaseViewModel.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import Foundation

protocol BaseViewModelProperty {
    var alertCompletion: ((_ title: String?, _ description: String?) -> Void)? { get }
    var loaderCompletion: ((Bool) -> Void)? { get }
//    var errorMessageCompletion: ((String?) -> Void)? { get } // to show messages in Toast
}

class BaseViewModel: BaseViewModelProperty {
    public var alertCompletion: ((_ title: String?, _ description: String?) -> Void)?
    public var loaderCompletion: ((Bool) -> Void)? = nil
}
