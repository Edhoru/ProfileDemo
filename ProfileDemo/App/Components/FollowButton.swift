//
//  CellButton.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/27/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

class FollowButton: UIButton {
    
    enum Mode: String {
        case follow
        case unfollow
    }
    
    //Properties
    private var mode: Mode!
    
    var followed: Bool {
        get {
            return mode == .follow ? true : false
        }
        set {
            self.mode = newValue == true ? .unfollow : .follow
            updateStyle()
        }
    }
    
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    private func updateStyle() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0.0
        }) { (success) in
            self.setTitle(self.mode.rawValue.capitalized, for: .normal)
            self.style(mode: self.mode)
            
            UIView.animate(withDuration: 0.3, animations: {
                self.alpha = 1.0
            })
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

