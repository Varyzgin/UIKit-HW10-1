//
//  SetupImageView.swift
//  UIKit-HW10-1
//
//  Created by Дима on 12/19/24.
//

import UIKit

extension UIImageView {
    func setupImageView(radius: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = radius
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
}
