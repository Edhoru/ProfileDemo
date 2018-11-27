//
//  ActionButton.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/27/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

class ActionButton: UIButton {
    
    var elementsContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var iconView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    init(icon: UIImage?, title: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        iconView.image = icon
        label.text = title
        self.styleAction()
        
        setupSubviews()
    }
    
    func setupSubviews() {
        addSubview(elementsContainer)
        elementsContainer.addSubview(iconView)
        elementsContainer.addSubview(label)
        
        let iconWidth: CGFloat = iconView.image != nil ? 12 : 0
        
        NSLayoutConstraint.activate([
            elementsContainer.topAnchor.constraint(equalTo: topAnchor),
            elementsContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            elementsContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            elementsContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            iconView.centerYAnchor.constraint(equalTo: elementsContainer.centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 12),
            iconView.widthAnchor.constraint(equalToConstant: iconWidth),
            
            label.centerYAnchor.constraint(equalTo: elementsContainer.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: iconWidth/2),
            label.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 18)
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
