//
//  Configurator.swift
//  UIKit-HW10-1
//
//  Created by Дима on 12/17/24.
//

import UIKit

extension UIView {
    static func config<T: UIView>(view: T,  completion: (T) -> Void) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        completion(view)
        return view
    }
}
