//
//  AMForgotBaseViewController.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import UIKit

class AMForgotPasswordBaseVC: BaseViewController {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDesc: UILabel!
    @IBOutlet var embedView: AMBaseTextField!
    @IBOutlet var btnSubmit: AMButton!
    @IBOutlet weak var embedOTPView: AMOTPTextFieldView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupUIInformation()
    }
    
    
    @IBAction func actionSubmit(_ sender: UIButton) {
        self.submitAction()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupUIInformation() {
        
    }
    
    func submitAction() {
        
    }
    
    final func validateAndSubmitInput(_ text: String, viewModel: AMForgotPasswordBaseViewModel) {
        guard viewModel.validateInput(text) else {
            return
        }
        
        viewModel.submitted(text) { success in
            success ? self.operationSucess() : self.operationFailed()
        }
    }
    
    final func validateAndSubmitInput(_ viewModel: AMForgotPasswordBaseViewModel) {
        let text = self.embedView.textField.text ?? ""
        self.validateAndSubmitInput(text, viewModel: viewModel)
    }
    
    func operationSucess() {
        
    }
    
    func operationFailed() {
        
    }

}
