//
//  ProfilePlacesView.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/27/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import UIKit

class ProfilePlacesView: UIView {
    
    //Properties
    var places: [Place] = []
    
    
    //UI
    lazy var addButton: ActionButton = {
        let button = ActionButton(icon: #imageLiteral(resourceName: "icon_add"), title: "add place")
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12.0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ProfilePlacesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        let placesDataSource = ProfilePlacesDataSource()
        places = placesDataSource.getPlaces()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        addSubview(addButton)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 35),
            addButton.widthAnchor.constraint(equalToConstant: 120),
            
            collectionView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22.5),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22.5),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}


extension ProfilePlacesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {        
        let place = places[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProfilePlacesCollectionViewCell
        cell .setup(place: place)
        
        return cell
    }
    
    
    
    
}

extension ProfilePlacesView: UICollectionViewDelegate {
    
}


extension ProfilePlacesView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 130)
    }
}
