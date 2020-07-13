//
//  CustomCollectionViewCell.swift
//  ITSPartner_Test
//
//  Created by Alexey Sergeev on 7/11/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderImageView: UIImageView!
    
    //MARK: Computed properties
    
    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0, alpha: 0.2)
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 8),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.6)
        ])
    }
}
