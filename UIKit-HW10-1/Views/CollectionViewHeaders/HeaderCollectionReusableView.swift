//
//  HeaderCollectionReusableView.swift
//  UIKit-HW10-1
//
//  Created by Дима on 12/19/24.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    
    private lazy var titleLabel = {
        $0.font = TextStyle.posterTitle
        return $0
    }(UILabel())
    
    func configure(with title: String) {
        titleLabel.text = title
        addSubview(titleLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
