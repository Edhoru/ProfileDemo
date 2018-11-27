//
//  SectionButton.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/26/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

protocol ProfileSectionsHeaderDelegate: class {
    func sectionSelected(_ sender: ProfileSectionHeaderView)
}

class ProfileSectionHeaderView: UIView {
    
    //Properties
    weak var delegate: ProfileSectionsHeaderDelegate?
    
    var place: Int = 0
    private var _isSelected: Bool = false
    var isSelected: Bool {
        get {
            return _isSelected
        }
        set {
            _isSelected = newValue
            if newValue == true {
                self.titleLabel.styleB2Enable()
            } else {
                self.titleLabel.styleB2Disable()
            }
            nodeView.backgroundColor = newValue == true ? .primary : .disable
        }
    }
    
    //UI
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    lazy private var nodeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    init(title: String, isSelected: Bool, place: Int) {
        super.init(frame: .zero)
        
        titleLabel.text = title
        self.isSelected = isSelected
        self.place = place
        
        setupProperties()
    }
    
    private func setupProperties() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonAction))
        addGestureRecognizer(tapGesture)
        
        setupUI()
    }
    
    private func setupUI() {
        
        addSubview(titleLabel)
        addSubview(nodeView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 22),
            
            nodeView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            nodeView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            nodeView.heightAnchor.constraint(equalToConstant: 10),
            nodeView.widthAnchor.constraint(equalToConstant: 10)
            ])
        
        nodeView.layer.cornerRadius = 5.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Action
    
    @objc private func buttonAction() {
        guard isSelected == false else { return }
        
        isSelected = true
        delegate?.sectionSelected(self)
    }
    
}
