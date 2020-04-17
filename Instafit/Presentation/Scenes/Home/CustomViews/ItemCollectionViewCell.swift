//
//  ItemCollectionViewCell.swift
//  Instafit
//
//  Created by Jordan Capa on 4/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import UIKit


class ItemCollectionViewCell: UICollectionViewCell {

    static var identifier: String = "itemCell"

    weak var textLabel: UILabel!
    let imageView = UIImageView(frame: .zero)
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let textLabel = UILabel(frame: .zero)
        
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame = frame
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20.0),
            textLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
                
        ])
        
        self.layer.cornerRadius = 6.0
        self.layer.masksToBounds = true
        self.textLabel = textLabel
        self.reset()
        
    }
    
    func setImage(url: String){
        if let photoUrl = URL(string: url){
            let placeholderImage = UIImage(named: "dwnlod-icon")!
            self.imageView.af.setImage(withURL: photoUrl, placeholderImage: placeholderImage)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }

    func reset() {
        self.textLabel.textAlignment = .center
        imageView.frame = self.contentView.frame
    }
}
