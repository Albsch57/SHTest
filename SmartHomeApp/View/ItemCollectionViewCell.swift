//
//  ItemCollectionViewCell.swift
//  SmartHomeApp
//
//  Created by Alona on 03.08.2022.
//

import Foundation
import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
   
    static let reuseId = "CellId"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let label: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(self.imageView)
        contentView.addSubview(self.label)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



