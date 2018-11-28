//
//  ProfileFriendsCollectionViewCell.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/27/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

class ProfileFriendsCollectionViewCell: UICollectionViewCell {
    
    var friend: User!
    
    lazy private var profileImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy private var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.styleT2()
        return label
    }()
    
    lazy private var usernameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.styleB3Disable()
        return label
    }()
    
    lazy private var followButton: FollowButton = {
        let button = FollowButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(updateFollowingStatus), for: .touchUpInside)
        return button
    }()
    
    
    func setup(friend: User) {
        self.friend = friend
        followButton.followed = friend.followed
        
        setupProperties()
    }
    
    private func setupProperties() {
        profileImageView.image = friend.photo
        nameLabel.text = friend.name
        usernameLabel.text = friend.username
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(followButton)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 45),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12),
            usernameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            usernameLabel.heightAnchor.constraint(equalToConstant: 19),
            
            followButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            followButton.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
            followButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            followButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            followButton.widthAnchor.constraint(equalToConstant: 73)
            
            ])
    }
    
    @objc private func updateFollowingStatus() {
        friend.followed = !friend.followed
        followButton.followed = friend.followed
    }
    
}
