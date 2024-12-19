//
//  AddSubviews.swift
//  UIKit-HW8-1
//
//  Created by Дима on 12/10/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview)
    }
}
