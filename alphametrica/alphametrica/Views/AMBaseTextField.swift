//
//  AMBaseTextField.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import UIKit

// this is the base textfiled.
//TODO: Since, many where email and password field are used. So, We can subclass it, specialized to email and another for password.
final class AMBaseTextField: UIView {
    
    @IBOutlet var lblPlaceholder: UILabel!
    @IBOutlet var imageIcon: UIImageView!
    @IBOutlet var textField: UITextField!

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
    
    //MARK: Public methods
    
    func setPlaceHolder(_ text: String) {
        self.lblPlaceholder.text = text
    }
    
    func setIcon(_ image: UIImage) {
        self.imageIcon.image = image
    }
    
    //MARK: Private methods
    
    private func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        let cons = view.constraintsForAnchoringTo(boundsOf: self)
        cons.forEach { $0.isActive = true }
    }
    
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "AMBaseTextField", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
