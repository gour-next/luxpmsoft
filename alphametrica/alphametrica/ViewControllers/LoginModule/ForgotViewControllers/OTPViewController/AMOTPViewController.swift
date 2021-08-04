//
//  AMOTPViewController.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 04/08/21.
//

import UIKit

class AMOTPViewController: AMForgotPasswordBaseVC {
    
    var viewModel: AMOTPViewModel = AMOTPViewModel()
    
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
        self.lblTitle.text = "A code has been sent to your email"
        self.lblDesc.text = "The code has been sent to \(self.viewModel.email).\nPlease enter the code below."
        
        self.embedView.isHidden = true
        self.embedOTPView.isHidden = false
        self.embedOTPView.delegate = self
        self.btnSubmit.setTitle("Verify", for: .normal)
    }
    
    override func submitAction() {
        self.validateAndSubmitInput(self.viewModel.writtenOTP, viewModel: self.viewModel)
    }
    
    override func operationSucess() {
        // push to other view controller
        DispatchQueue.main.async {
            let vc: AMNewPasswordViewController = self.getViewController(derivedFromBaseClass: AMForgotPasswordBaseVC.self)
            let mViewModel = AMNewPasswordViewModel()
            mViewModel.email = self.viewModel.email
            vc.viewModel = mViewModel
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func operationFailed() {
        // show soem error here
    }

}

//MARK: AMOTPTextFieldViewDelegate
extension AMOTPViewController: AMOTPTextFieldViewDelegate {
    func didEnter(OTP: String) {
        self.viewModel.writtenOTP = OTP
    }
    
    func resendOTP() {
        self.viewModel.resendOTP { success in
            // do your logic here
        }
    }
}
