//
//  ProfileFavoritesView.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/27/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit
import SpriteKit

class ProfileFavoritesView: UIView {
    
    //Properties
    let scene: EmoticonScene!
    
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
    
    lazy var animationView: SKView = {
        let view = SKView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.ignoresSiblingOrder = true
        return view
    }()
    
    
    init() {
        scene = EmoticonScene(size: CGSize(width: 50, height: 50))
        
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        setupAnimation()
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAnimation() {
        animationView.presentScene(scene)
    }
    
    func setupSubviews() {
        addSubview(emoticonView)
        addSubview(messageLabel)
        addSubview(exploreButton)
        addSubview(animationView)
        
        NSLayoutConstraint.activate([
            emoticonView.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            emoticonView.centerXAnchor.constraint(equalTo: centerXAnchor),
            emoticonView.heightAnchor.constraint(equalToConstant: 43.5),
            emoticonView.widthAnchor.constraint(equalToConstant: 43.5),
            
            animationView.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 43.5),
            animationView.widthAnchor.constraint(equalToConstant: 43.5),
            
            messageLabel.topAnchor.constraint(equalTo: emoticonView.bottomAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            messageLabel.heightAnchor.constraint(equalToConstant: 80),
            
            exploreButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            exploreButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            exploreButton.heightAnchor.constraint(equalToConstant: 35),
            exploreButton.widthAnchor.constraint(equalToConstant: 105)
            
            ])
    }
    
    func startAnimation() {
        scene.animateBear()
    }
    
    func stopAnimation() {
        scene.stop()
    }
    
}
