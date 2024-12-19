//
//  GetRatio.swift
//  UIKit-HW9-1
//
//  Created by Дима on 12/15/24.
//

import UIKit

extension UIImage {
    func getRatio() -> CGFloat?{
        return self.size.height / self.size.width
    }
}
