//
//  Resize.swift
//  UIKit-HW8-1
//
//  Created by Дима on 12/10/24.
//


import UIKit

extension UIImage {
    func resize(width: CGFloat = 100, height: CGFloat = 100) -> UIImage {
        let size = CGSize(width: width, height: height)
        let renderer = UIGraphicsImageRenderer(size: size)
    
        return renderer.image { _ in
            let rect = CGRect(origin: .zero, size: size)
            let path = UIBezierPath(roundedRect: rect, cornerRadius: 20)
            path.addClip()
            self.draw(in: rect)
        }
    }
}
