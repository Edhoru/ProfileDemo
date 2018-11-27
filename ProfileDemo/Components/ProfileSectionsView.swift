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
    private var sectionViews: [ProfileSectionButton] = []
    private var selectedSection: ProfileSectionButton!
    
    
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
        view.backgroundColor = .textDisable
        return view
    }()
    
    
    init(with sections: [String]) {
        self.sectionNames = sections
        
        super.init(frame: .zero)
        
        backgroundColor = .green
        print(sections)
        
        setupSectionButtons()
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSectionButtons() {
        for index in 0...sectionNames.count - 1 {
            let sectionView = ProfileSectionButton(title: sectionNames[index], isSelected: index == 0, place: index)
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
    
    func setupSubviews() {
        addSubview(headerView)
        addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 49)
            ])
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
            ])
    }
    
}


extension ProfileSectionsView: ProfileSectionDelegate {
    
    func sectionSelected(_ sender: ProfileSectionButton) {
        selectedSection.isSelected = false
        selectedSection = sender
    }
}