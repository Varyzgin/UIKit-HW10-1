//
//  SetupLabel.swift
//  UIKit-HW8-1
//
//  Created by Дима on 12/10/24.
//

import UIKit

extension UILabel {
    func setupLabel(textStyle: UIFont, textColor: UIColor = .black, numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.numberOfLines = numberOfLines
        label.textAlignment = .left
        label.textColor = textColor
        
        label.font = textStyle
        
        return label
    }
}
