//
//  StoriesCellView.swift
//  UIKit-HW10-1
//
//  Created by Дима on 12/17/24.
//

import UIKit

class StoriesCellView : UICollectionViewCell, CellProtocol {
    static let identifier: String = "StoriesCellView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(pictureImageView, authorLabel)
    }
    
    func configure(with content: Stories) {
        pictureImageView.image = UIImage(named: content.pictureName)
        authorLabel.text = content.authorName
    }

    private lazy var pictureImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = frame.width / 2
        return $0
    }(UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: frame.width, height: frame.width))))
    
    private lazy var authorLabel: UILabel = {
        $0.textAlignment = .center
        $0.font = TextStyle.description
        return $0
    }(UILabel(frame: CGRect(x: 0, y: pictureImageView.frame.maxY + Margins.XS, width: frame.width, height: scaleMultiplier() * 20)))
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
