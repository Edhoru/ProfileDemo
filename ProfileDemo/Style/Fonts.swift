//
//  Fonts.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/26/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

struct Fonts {
    
    private struct Name {
        
        struct OpenSans {
            static let bold = "OpenSans-Bold"
            static let boldItalic = "OpenSans-BoldItalic"
            static let extraBold = "OpenSans-ExtraBold"
            static let extraBoldItalic = "OpenSans-ExtraBoldItalic"
            static let italic = "OpenSans-Italic"
            static let light = "OpenSans-Light"
            static let lightItalic = "OpenSans-LightItalic"
            static let regular = "OpenSans-Regular"
            static let semiBold = "OpenSans-SemiBold"
            static let semiBoldItalic = "OpenSans-SemiBoldItalic"
        }
        
    }
    
    static let t22 = UIFont(name: Fonts.Name.OpenSans.semiBold, size: 22.0)!
    static let t16 = UIFont(name: Fonts.Name.OpenSans.semiBold, size: 16.0)!
    
    static let b18 = UIFont(name: Fonts.Name.OpenSans.regular, size: 18.0)!
    static let b16 = UIFont(name: Fonts.Name.OpenSans.regular, size: 16.0)!
    static let b14 = UIFont(name: Fonts.Name.OpenSans.regular, size: 14.0)!
    static let b13 = UIFont(name: Fonts.Name.OpenSans.regular, size: 13.0)!
    static let b11 = UIFont(name: Fonts.Name.OpenSans.regular, size: 11.0)!
    
}

