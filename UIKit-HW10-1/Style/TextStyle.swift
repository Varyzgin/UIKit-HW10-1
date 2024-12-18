//
//  Text.swift
//  UIKit-HW8-1
//
//  Created by Дима on 12/10/24.
//

import UIKit

enum TextStyle {
    case megaHeader, header, description, subDescription, boldDescription
    
    func value() -> UIFont {
        switch self {
        case .megaHeader: return .systemFont(ofSize: 20 * scaleMultiplier(), weight: .black)
        case .header: return .boldSystemFont(ofSize: 20 * scaleMultiplier())
        case .boldDescription: return .boldSystemFont(ofSize: 16 * scaleMultiplier())
        case .description: return .systemFont(ofSize: 16 * scaleMultiplier())
        case .subDescription: return .systemFont(ofSize: 14 * scaleMultiplier())
        }
    }
}
