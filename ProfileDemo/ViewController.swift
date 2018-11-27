//
//  ViewController.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/26/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Properties
    
    
    //UI
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sectionsContainer: UIView!
    
    var profileImage: UIImage? {
        get {
            return profileImageView.image
        }
        set {
            profileImageView.image = newValue
        }
    }
    
    var sectionsView: ProfileSectionsView = {
        let sectionsView = ProfileSectionsView(with: ["Places", "Favorites", "Friends"])
        sectionsView.translatesAutoresizingMaskIntoConstraints = false
        return sectionsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupProperties()
    }
    
    func setupProperties() {
        profileImage = #imageLiteral(resourceName: "Profile Img_11")
        titleLabel.styleT1()
        
        setupSubviews()
    }
    
    func setupSubviews() {
        
        sectionsContainer.addSubview(sectionsView)
        
        NSLayoutConstraint.activate([
            sectionsView.topAnchor.constraint(equalTo: sectionsContainer.topAnchor),
            sectionsView.leadingAnchor.constraint(equalTo: sectionsContainer.leadingAnchor),
            sectionsView.trailingAnchor.constraint(equalTo: sectionsContainer.trailingAnchor),
            sectionsView.bottomAnchor.constraint(equalTo: sectionsContainer.bottomAnchor)
            ])
        
    }

}
