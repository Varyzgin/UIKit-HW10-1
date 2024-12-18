//
//  Text.swift
//  UIKit-HW8-1
//
//  Created by Дима on 12/10/24.
//

import UIKit

struct TextStyle {
    static let S: UIFont = .systemFont(ofSize: 14 * scaleMultiplier())
    static let M: UIFont = .systemFont(ofSize: 16 * scaleMultiplier())
    static let L: UIFont = .boldSystemFont(ofSize: 16 * scaleMultiplier())
    static let XL: UIFont = .boldSystemFont(ofSize: 20 * scaleMultiplier())
    static let XXL: UIFont = .systemFont(ofSize: 20 * scaleMultiplier(), weight: .black)
}
