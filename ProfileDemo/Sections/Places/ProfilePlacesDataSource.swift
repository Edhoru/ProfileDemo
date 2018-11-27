//
//  ProfilePlacesDataSource.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/27/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import Foundation

class ProfilePlacesDataSource {
    
    func getPlaces() -> [Place] {
        return [
            Place(name: "Paris",
                  icon: #imageLiteral(resourceName: "City Icon_Paris_White.png"),
                  image: #imageLiteral(resourceName: "Paris"),
                  spots: 3),
            Place(name: "Tokyo",
                  icon: #imageLiteral(resourceName: "City Icon_Tokyo_White"),
                  image: #imageLiteral(resourceName: "Tokyo"),
                  spots: 5),
            Place(name: "New York",
                  icon: #imageLiteral(resourceName: "City Icon_New York_White.png"),
                image: #imageLiteral(resourceName: "New-York"),
                spots: 4),
            Place(name: "Los Angeles",
                  icon: #imageLiteral(resourceName: "City Icon_Los Angeles_White.png"),
                image: #imageLiteral(resourceName: "Los-Angeles"),
                spots: 3),
        ]
    }
    
}
