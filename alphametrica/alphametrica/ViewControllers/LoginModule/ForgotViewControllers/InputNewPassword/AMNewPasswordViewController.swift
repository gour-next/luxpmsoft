//
//  AMNewPasswordViewController.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import UIKit

final class AMNewPasswordViewController: AMForgotPasswordBaseVC {
    
    var viewModel: AMNewPasswordViewModel = AMNewPasswordViewModel()

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
        self.lblTitle.text = "Enter New Password"
        self.lblDesc.text = nil
        self.embedView.textField.placeholder = "********"
        self.embedView.textField.isSecureTextEntry = true
        self.embedView.setPlaceHolder("New Password")
        if let image = UIImage(named: "security_icon") {
            self.embedView.setIcon(image)
        }
        self.btnSubmit.setTitle("Set New Password", for: .normal)
    }
    
    override func submitAction() {
        self.validateAndSubmitInput(self.viewModel)
    }
    
    override func operationSucess() {
        // push to other view controller
        DispatchQueue.main.async {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    override func operationFailed() {
        // show soem error here
    }
}
