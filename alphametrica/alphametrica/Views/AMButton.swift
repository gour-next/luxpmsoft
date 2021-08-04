//
//  AMButton.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import UIKit

@IBDesignable class AMButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func setupView() {
        self.backgroundColor = isActive ? activeColor : inactiveColor
        self.setTitleColor(isActive ? .white : .black, for: .normal)
        self.layer.cornerRadius = cornerRadius
    }
        
    @IBInspectable
    var isActive: Bool = false {
        didSet {
            self.setupView()
        }
    }

    @IBInspectable
    var activeColor: UIColor = UIColor(named: "button_active_color")! {
        didSet {
            self.setupView()
        }
    }
    
    @IBInspectable
    var inactiveColor: UIColor = UIColor.gray {
        didSet {
            self.setupView()
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 10 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

}
