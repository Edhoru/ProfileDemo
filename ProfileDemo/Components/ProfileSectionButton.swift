//
//  SectionButton.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/26/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

class ProfileSectionButton: UIView {
    
    //Properties
    private var isSelected: Bool = false
    
    //UI
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.styleB2Enable()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    lazy private var nodeView: UIView = {
        let view = UIView()
        view.backgroundColor = .textDisable
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    
    init(title: String, selected: Bool) {
        super.init(frame: .zero)
        
        titleLabel.text = title
        isSelected = selected
        
        setupProperties()
    }
    
    private func setupProperties() {
        setupUI()
    }
    
    private func setupUI() {
        if isSelected == true {
            self.titleLabel.styleB2Enable()
        } else {
            self.titleLabel.styleB2Disable()
        }
        self.nodeView.backgroundColor = isSelected == true ? .primary : .textDisable
        
        addSubview(titleLabel)
        addSubview(nodeView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 22)
            ])
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
