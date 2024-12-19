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
        backgroundColor = ColorScheme.lightgray
        layer.cornerRadius = 20 * scaleMultiplier()
        
        addSubviews(pictureImageView, textLabel)
    }
    
    func configure(with content: Messages) {
        pictureImageView.image = UIImage(named: content.pictureName)
        textLabel.text = content.messageText
    }
    
    private lazy var pictureImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20 * scaleMultiplier()
        return $0
    }(UIImageView(frame: CGRect(x: Margins.S, y: Margins.S, width: frame.height - 2 * Margins.S, height: frame.height - 2 * Margins.S)))
    
    private lazy var textLabel: UILabel = {
        $0.numberOfLines = 0
        $0.font = TextStyle.description
        return $0
    }(UILabel(frame: CGRect(x: pictureImageView.frame.maxX + Margins.S, y: Margins.S, width: contentView.frame.maxX - pictureImageView.frame.maxX - 2 * Margins.S, height: frame.height - 2 * Margins.S)))
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
