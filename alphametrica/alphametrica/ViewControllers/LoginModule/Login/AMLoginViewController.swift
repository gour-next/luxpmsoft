//
//  AMLoginViewController.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import UIKit

class AMLoginViewController: BaseViewController {
    
    @IBOutlet var embedEmailView: AMBaseTextField!
    @IBOutlet var embedPasswordView: AMBaseTextField!
    @IBOutlet var btnRegister: UIButton!
    
    var viewModel: AMLoginViewModel = AMLoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupUIInformation()
        self.viewModel.initiate()
        self.setupLoaderAndAlert(self.viewModel)
    }
    
    @IBAction func actionSignin(_ sender: UIButton) {
        // the the text from textfield
        let email = self.embedEmailView.textField.text ?? ""
        let password = self.embedPasswordView.textField.text ?? ""
        
        // check if its valid
        guard self.viewModel.validateInputCredential(email, and: password) else { return }
        
        // now proceed to signin
        self.viewModel.login(with: email, and: password) { isSuccess in
            DispatchQueue.main.async {
                if isSuccess {
                    // push to desired ViewController
                    print("Login success. Push to ViewController")
                } else {
                    // show error information if you need any.
                }
            }
        }
    }
    
    @IBAction func actionRegister(_ sender: UIButton) {
        // push to Register Controller
        self.presentAlert(with: "Registration", description: "Functionality in-progress.ß")
    }
    
    @IBAction func actionForgetPassword(_ sender: UIButton) {
        // push to Forget password Controller
        let vc: AMForgotPasswordViewController = self.getViewController(derivedFromBaseClass: AMForgotPasswordBaseVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
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
        
        self.embedEmailView.textField.placeholder = "sabahat@gmail.com"
        self.embedEmailView.textField.keyboardType = .emailAddress
        self.embedEmailView.setPlaceHolder("Email")
        if let image = UIImage(named: "email_icon") {
            self.embedEmailView.setIcon(image)
        }
        
        self.embedPasswordView.textField.placeholder = "********"
        self.embedPasswordView.textField.isSecureTextEntry = true
        self.embedPasswordView.setPlaceHolder("New Password")
        if let image = UIImage(named: "security_icon") {
            self.embedPasswordView.setIcon(image)
        }
        
        let underlineAttribute: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14.0)
        ]
        let underlineAttributedString = NSAttributedString(string: "Register", attributes: underlineAttribute)
        self.btnRegister.setAttributedTitle(underlineAttributedString, for: .normal)
    }

}
