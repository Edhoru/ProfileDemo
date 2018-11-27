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
    
}
