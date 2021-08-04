//
//  AMLogoLabel.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import UIKit

final class AMLogoLabel: AMGradientLabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override func drawText(in rect: CGRect) {
        self.text = "alphametrica"
        super.drawText(in: rect)
    }
    
    
    override func getGradientColors() -> [CGColor] {
        
        let uiColor: (CGFloat,CGFloat,CGFloat) -> UIColor = { r,g,b in
            let didvider: CGFloat = 255.0
            return UIColor(displayP3Red: r/didvider, green: g/didvider, blue: b/didvider, alpha: 1.0)
        }
        let startColor = uiColor(191, 234, 217)
        let endColor = uiColor(56, 43, 106)
        let mColors = [startColor, endColor]
        return mColors.map { $0.cgColor }
    }
}
