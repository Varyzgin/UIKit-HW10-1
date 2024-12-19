//
//  StoriesCellView.swift
//  UIKit-HW10-1
//
//  Created by Дима on 12/17/24.
//

import UIKit

class FeedsCellView : UICollectionViewCell, CellProtocol {
    static let identifier: String = "FeedsCellView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 20 * scaleMultiplier()
        backgroundColor = ColorScheme.background
        contentView.addSubviews(profileImageView, authorNameLabel, posterImageView, headerLabel, dateLabel, postTextLabel)
    }
    
    func configure(with content: Feeds) {
        profileImageView.image = UIImage(named: content.profileImageName)
        authorNameLabel.text = content.authorNameText
        posterImageView.image = UIImage(named: content.posterImageName)
        headerLabel.text = content.headerText
        dateLabel.text = content.date
        postTextLabel.text = content.descriptionText
        
        setupConstraints()
    }
    
    private let screenWidth = UIScreen.main.bounds.width
    
    private lazy var profileImageView = setupImageView(radius: 25 * scaleMultiplier())
    private lazy var authorNameLabel = UILabel().setupLabel(textStyle: TextStyle.megaHeader)
    private lazy var posterImageView = setupImageView(radius: 20 * scaleMultiplier())
    private lazy var headerLabel = UILabel().setupLabel(textStyle: TextStyle.megaHeader)
    private lazy var dateLabel = UILabel().setupLabel(textStyle: TextStyle.subDescription)
    private lazy var postTextLabel = UILabel().setupLabel(textStyle: TextStyle.description)
    
    private func setupImageView(radius: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = radius
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    private func setupConstraints() {
        activateConstraints(profileImageView, authorNameLabel, posterImageView, headerLabel, dateLabel, postTextLabel)
        
        let imageRatio = posterImageView.image?.getRatio() ?? 0
        let imageHeight = imageRatio * screenWidth
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margins.M),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Margins.M),
            profileImageView.widthAnchor.constraint(equalToConstant: 50 * scaleMultiplier()),
            profileImageView.heightAnchor.constraint(equalToConstant: 50 * scaleMultiplier()),
            
            authorNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: Margins.M),
            authorNameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            authorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margins.M),
            
            posterImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: Margins.M),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margins.M),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margins.M),
            posterImageView.heightAnchor.constraint(equalToConstant: imageHeight),
            
            headerLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: Margins.M),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margins.M),
            headerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margins.M),
            
            dateLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: Margins.M),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margins.M),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margins.M),
            
            postTextLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Margins.M),
            postTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margins.M),
            postTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margins.M),
            postTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Margins.M)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
