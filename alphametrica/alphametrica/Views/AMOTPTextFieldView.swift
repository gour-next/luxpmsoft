//
//  AMOTPTextFieldView.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 04/08/21.
//

import UIKit

protocol AMOTPTextFieldViewDelegate: class {
    func didEnter(OTP: String)
    func resendOTP()
}

class AMOTPTextFieldView: UIView {
    
    @IBOutlet var textField: UITextField!
    weak var delegate: AMOTPTextFieldViewDelegate? = nil

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    @IBAction func actionResend(_ sender: UIButton) {
        self.delegate?.resendOTP()
    }
    
    //MARK: Private methods
    
    private func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        let cons = view.constraintsForAnchoringTo(boundsOf: self)
        cons.forEach { $0.isActive = true }
        self.setupUI()
    }
    
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "AMOTPTextFieldView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    private func setupUI() {
        // In here we can design the textfield as we need.
        // For now, I am just taking functionality in account.
        self.textField.delegate = self
    }

}

extension AMOTPTextFieldView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate?.didEnter(OTP: textField.text ?? "")
    }
}
