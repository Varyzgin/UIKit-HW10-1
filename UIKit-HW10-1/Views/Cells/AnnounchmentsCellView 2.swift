//
//  StoriesCellView.swift
//  UIKit-HW10-1
//
//  Created by Дима on 12/17/24.
//

import UIKit

class AnnouncementsCellView : UICollectionViewCell, CellProtocol {
    static let identifier: String = "AnnouncementsCellView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(pictureImageView)
    }
    
    lazy var headerLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = TextStyle.XXL
        $0.textColor = .white
        return $0
    }(UILabel())
    
    lazy var descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = TextStyle.S
        $0.textColor = .white
        return $0
    }(UILabel())

    lazy var pictureImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        
        $0.addSubview(headerLabel)
        $0.addSubview(descriptionLabel)

        return $0
    }(UIImageView(frame: contentView.frame))
    
    func configure(with content: Announcements) {
        pictureImageView.image = UIImage(named: content.posterName)
        headerLabel.text = content.headerText
        descriptionLabel.text = content.descriptionText
        
        setupConstraints()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: pictureImageView.topAnchor, constant: Margins.M),
            headerLabel.leadingAnchor.constraint(equalTo: pictureImageView.leadingAnchor, constant: Margins.M),
            headerLabel.trailingAnchor.constraint(equalTo: pictureImageView.trailingAnchor, constant: -Margins.M),
            headerLabel.heightAnchor.constraint(equalToConstant: scaleMultiplier() * 25),

            descriptionLabel.topAnchor.constraint(greaterThanOrEqualTo: headerLabel.bottomAnchor, constant: Margins.M),
            descriptionLabel.leadingAnchor.constraint(equalTo: pictureImageView.leadingAnchor, constant: Margins.M),
            descriptionLabel.trailingAnchor.constraint(equalTo: pictureImageView.trailingAnchor, constant: -Margins.M),
            descriptionLabel.bottomAnchor.constraint(equalTo: pictureImageView.bottomAnchor, constant: -Margins.M),

        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}