//
//  ProfileFavoritesView.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/27/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

class ProfileFavoritesView: UIView {
    
    //Properties
    
    
    //UI
    lazy var emoticonView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "emoticon")
        return imageView
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No favorites as yet. Let's find you some places that you would like to visit."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.styleB1(.light)
        return label
    }()
    
    lazy var exploreButton: ActionButton = {
        let button = ActionButton(icon: #imageLiteral(resourceName: "icon_search"), title: "explore")
        return button
    }()
    
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        addSubview(emoticonView)
        addSubview(messageLabel)
        addSubview(exploreButton)
        
        NSLayoutConstraint.activate([
            emoticonView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 48),
            emoticonView.centerXAnchor.constraint(equalTo: centerXAnchor),
            emoticonView.bottomAnchor.constraint(lessThanOrEqualTo: messageLabel.topAnchor, constant: -20),
            emoticonView.heightAnchor.constraint(equalToConstant: 50),
            emoticonView.widthAnchor.constraint(equalToConstant: 50),
            
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            
            exploreButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            exploreButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            exploreButton.heightAnchor.constraint(equalToConstant: 35),
            exploreButton.widthAnchor.constraint(equalToConstant: 105)
            
            ])
    }
    
}
