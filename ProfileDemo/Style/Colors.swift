//
//  Colors.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/26/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

extension UIColor {
    
    enum Mode {
        case primary
        case light
        case medium
        case dark
        case white
    }
    
    static let primary =  #colorLiteral(red: 0, green: 0.8, blue: 0.7019607843, alpha: 1) //#00CCB3
    static let disable = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1) //#EAEAEA
    
    static let textDark =  #colorLiteral(red: 0.1764705882, green: 0.2274509804, blue: 0.2941176471, alpha: 1) //#2D3A4B
    static let textMedium = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1) //#9B9B9B
    static let textLight =  #colorLiteral(red: 0.7333333333, green: 0.7764705882, blue: 0.8078431373, alpha: 1) //#BBC6CE
    
}
