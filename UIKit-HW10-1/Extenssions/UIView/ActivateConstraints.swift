//
//  ConstraintsActivate.swift
//  UIKit-HW8-1
//
//  Created by Дима on 12/10/24.
//

import UIKit

extension UIView {
    func activateConstraints(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
