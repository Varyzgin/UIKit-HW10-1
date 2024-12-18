//
//  Colors.swift
//  UIKit-HW8-1
//
//  Created by Дима on 12/10/24.
//

import UIKit

enum ColorScheme {
    case red, green, gray, black, white, background
    
    func value() -> UIColor {
        switch self {
        case .red: return UIColor(red: 203/256, green: 22/256, blue: 63/256, alpha: 1)
        case .green: return UIColor(red: 3/256, green: 191/256, blue: 111/256, alpha: 1)
        case .gray: return UIColor(red: 117/256, green: 111/256, blue: 111/256, alpha: 1)
        case .background: return  UIColor(red: 247/256, green: 247/256, blue: 247/256, alpha: 1)
        case .black: return .black
        case .white: return .white
        }
    }
}
