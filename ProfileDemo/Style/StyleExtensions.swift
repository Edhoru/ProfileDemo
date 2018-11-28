//
//  StyleExtensions.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/26/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

extension UILabel {
    
    /** Biggest size, used on the user name */
    func styleT1() {
        self.textColor = .textEnable
        self.font = Fonts.t22
    }
    
    /** Biggest size in white, used on places name */
    func styleT1White() {
        self.textColor = .white
        self.font = Fonts.t22
    }
    
    /** Used on */
    func styleT2() {
        self.textColor = .textEnable
        self.font = Fonts.t16
    }
    
    /** Used on */
    func styleB1() {
        self.textColor = .textEnable
        self.font = Fonts.b18
    }
    
    /** Used on section buttons */
    func styleB2Enable() {
        self.textColor = .textEnable
        self.font = Fonts.b16
    }
    
    /** Used on section buttons */
    func styleB2Disable() {
        self.textColor = .textDisable
        self.font = Fonts.b16
    }
    
    /** Used on friends cells */
    func styleB3Disable() {
        self.textColor = .textDisable
        self.font = Fonts.b14
    }

    func styleB3Enable() {
        self.textColor = .primary
        self.font = Fonts.b11
    }
    
    func styleActionButton() {
        self.textColor = .primary
        self.font = Fonts.b13
        self.text = self.text?.uppercased()
        self.textAlignment = .center
    }
    
    func styleCellsButtonPrimary() {
        self.textColor = .primary
        self.font = Fonts.b14
        self.text = self.text?.capitalized
    }
    
    func styleCellsButtonDisable() {
        self.textColor = .textDisable
        self.font = Fonts.b14
        self.text = self.text?.capitalized
    }
    
    
}


extension ActionButton {
    
    func styleAction() {
        label.styleActionButton()
        self.clipsToBounds = true
        self.layer.cornerRadius = 2
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.primary.cgColor
    }
    
}


extension FollowButton {
    
    func style(mode: FollowButton.Mode) {
        self.clipsToBounds = true
        self.layer.cornerRadius = 2
        self.layer.borderColor = UIColor.primary.cgColor
        
        titleLabel?.font = Fonts.b14
        
        switch mode {
        case .follow:
            self.layer.borderWidth = 1.0
            setTitleColor(.primary, for: .normal)
            break
        case .unfollow:
            self.layer.borderWidth = 0.0
            setTitleColor(.textDisable, for: .normal)
            break
        }
        
    }
}
