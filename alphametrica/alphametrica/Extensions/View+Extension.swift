//
//  View+Extension.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import Foundation
import UIKit

extension UIView {

    /// Returns a collection of constraints to anchor the bounds of the current view to the given view.
    ///
    /// - Parameter view: The view to anchor to.
    /// - Returns: The layout constraints needed for this constraint.
    func constraintsForAnchoringTo(boundsOf view: UIView, and constant: CGFloat = 0) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: constant),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: constant)
        ]
    }
    
    /// Returns a collection of constraints to anchor the bounds of the current view to the given view.
    ///
    /// - Parameter view: The view to anchor to.
    /// - Returns: The layout constraints needed for this constraint.
    func constraintsForAnchoringTo(boundsOf view: UIView, and constant: (top: CGFloat, down: CGFloat, left: CGFloat, right: CGFloat)) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant.top),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant.left),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: constant.down),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: constant.right)
        ]
    }
}
