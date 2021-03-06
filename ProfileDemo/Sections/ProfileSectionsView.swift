//
//  ProfileSectionsView.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/26/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

class ProfileSectionsView: UIView {
    
    //Properties
    private var sectionNames: [String]
    private var sectionViews: [ProfileSectionHeaderView] = []
    private var selectedSection: ProfileSectionHeaderView!
    private let placesView = ProfilePlacesView()
    private let favoritesView = ProfileFavoritesView()
    private let friendsView = ProfileFriendsView()
    
    
    //UI
    var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightElement
        return view
    }()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    
    init(with sections: [String]) {
        self.sectionNames = sections
        
        super.init(frame: .zero)
        
        scrollView.delegate = self
        
        setupSectionButtons()
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        addSubview(headerView)
        addSubview(separatorView)
        addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 49),
            
            separatorView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            scrollView.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        
        setupSectionContent()
    }
    
    func setupSectionButtons() {
        for index in 0...sectionNames.count - 1 {
            let sectionView = ProfileSectionHeaderView(title: sectionNames[index], isSelected: index == 0, place: index)
            sectionView.delegate = self
            headerView.addSubview(sectionView)
            
            sectionView.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
            sectionView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
            
            if let previousSection = sectionViews.last {
                sectionView.leadingAnchor.constraint(equalTo: previousSection.trailingAnchor).isActive = true
                sectionView.widthAnchor.constraint(equalTo: previousSection.widthAnchor).isActive = true
            } else {
                selectedSection = sectionView
                sectionView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
            }
            
            if index == sectionNames.count - 1 {
                sectionView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
            }
            
            sectionViews.append(sectionView)
        }
    }
    
    func setupSectionContent() {
        scrollView.addSubview(placesView)
        scrollView.addSubview(favoritesView)
        scrollView.addSubview(friendsView)
        
        NSLayoutConstraint.activate([
            placesView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            placesView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            placesView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            placesView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            favoritesView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            favoritesView.leadingAnchor.constraint(equalTo: placesView.trailingAnchor),
            favoritesView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            favoritesView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            friendsView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            friendsView.leadingAnchor.constraint(equalTo: favoritesView.trailingAnchor),
            friendsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            friendsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            friendsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            friendsView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            ])
    }
    
}


extension ProfileSectionsView: ProfileSectionsHeaderDelegate {
    
    func sectionSelected(_ sender: ProfileSectionHeaderView) {
        selectedSection.isSelected = false
        selectedSection = sender
        
        let x = scrollView.bounds.width * CGFloat(sender.place)
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
        
    }
}


extension ProfileSectionsView: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        let page = offset.x / scrollView.bounds.width
        
        guard let newView = sectionViews.filter({ $0.place == Int(page) }).first else { return }
        
        guard newView.place != selectedSection.place else { return }
        
        selectedSection.isSelected = false
        newView.isSelected = true
        selectedSection = newView
        
        if offset == favoritesView.frame.origin {
            favoritesView.startAnimation()
        } else {
            favoritesView.stopAnimation()
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        if offset == favoritesView.frame.origin {
            favoritesView.startAnimation()
        } else {
            favoritesView.stopAnimation()
        }
    }
    
}

