//
//  ProfilePlacesCollectionViewCell.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/27/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

class ProfilePlacesCollectionViewCell: UICollectionViewCell {
    
    var place: Place!
    
    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var iconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var darkCover: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.35
        return view
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.styleT1White()
        return label
    }()
    
    private var spotsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.styleB3(.primary)
        return label
    }()
    
    
    func setup(place: Place) {
        self.place = place
        
        imageView.image = place.image
        iconImageView.image = place.icon
        nameLabel.text = place.name
        spotsLabel.text = "\(place.spots) spots"
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(imageView)
        addSubview(darkCover)
        addSubview(iconImageView)
        addSubview(nameLabel)
        addSubview(spotsLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            darkCover.topAnchor.constraint(equalTo: topAnchor),
            darkCover.leadingAnchor.constraint(equalTo: leadingAnchor),
            darkCover.trailingAnchor.constraint(equalTo: trailingAnchor),
            darkCover.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            iconImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor),
            
            spotsLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 12),
            spotsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            spotsLabel.heightAnchor.constraint(equalToConstant: 20),
            spotsLabel.widthAnchor.constraint(equalToConstant: 55),
            spotsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
            
            ])
        
        
    }
    
    
}
