//
//  AMForgotViewController.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import UIKit

class AMForgotPasswordViewController: AMForgotPasswordBaseVC {
    
    var viewModel: AMForgotPasswordViewModel = AMForgotPasswordViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.viewModel.initiate()
        self.setupLoaderAndAlert(self.viewModel)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func setupUIInformation() {
        self.lblTitle.text = "Forgot Password?"
        self.lblDesc.text = "Please enter the email associated to your account"
        self.embedView.textField.placeholder = "sabahat@gmail.com"
        self.embedView.textField.keyboardType = .emailAddress
        self.embedView.setPlaceHolder("Email")
        if let image = UIImage(named: "email_icon") {
            self.embedView.setIcon(image)
        }
        self.btnSubmit.setTitle("Submit Email", for: .normal)
    }
    
    override func submitAction() {
        self.validateAndSubmitInput(self.viewModel)
    }
    
    override func operationSucess() {
        // push to other view controller
        DispatchQueue.main.async {
            let vc: AMOTPViewController = self.getViewController(derivedFromBaseClass: AMForgotPasswordBaseVC.self)
            let mViewModel = AMOTPViewModel()
            mViewModel.email = self.embedView.textField.text ?? ""
            mViewModel.otp = self.viewModel.otp
            vc.viewModel = mViewModel
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func operationFailed() {
        // show soem error here
    }

}
