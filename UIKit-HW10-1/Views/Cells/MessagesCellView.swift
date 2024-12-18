//
//  StoriesCellView.swift
//  UIKit-HW10-1
//
//  Created by Дима on 12/17/24.
//

import UIKit


class MessagesCellView : UICollectionViewCell, CellProtocol {
    static let identifier: String = "MessagesCellView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
    }

//    lazy var pictureImageView = {
//        $0.contentMode = .scaleAspectFill
//        $0.clipsToBounds = true
//        $0.layer.cornerRadius = frame.width / 2
//        return $0
//    }(UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.width)))
//    
//    lazy var authorLabel: UILabel = {
//        return $0
//    }(UILabel(frame: CGRect(x: 0, y: pictureImageView.frame.maxY + Margins.small.value(), width: frame.width, height: frame.height - pictureImageView.frame.maxY)))
    
    func configure(with content: Stories) {
//        pictureImageView.image = UIImage(named: content.pictureName)
//        authorLabel.text = content.authorName
        
//        contentView.addSubview(pictureImageView)
//        contentView.addSubview(authorLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
