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
        setTitle(mode.rawValue.capitalized, for: .normal)
        style(mode: mode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

