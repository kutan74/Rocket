//
//  ZeplinSelectScreenDataSource.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

protocol ZeplinSelectScreenDataSourceProtocol: class {
    func didSelectScreen(forId id: String)
}

class ZeplinSelectScreenDataSource: NSObject {
    var screens: [ZeplinScreen]
    weak var delegate: ZeplinSelectScreenDataSourceProtocol?
    
    init(screens: [ZeplinScreen]) {
        self.screens = screens
    }
}

// MARK: CollectionView Delegate & Datasoure

extension ZeplinSelectScreenDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ZeplinScreenCollectionViewCell
        
        let screen = screens[indexPath.row]
        cell.thumnailImageView.kf.setImage(with: URL(string: screen.image.original_url))
        cell.screenNameLabel.text = screen.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectScreen(forId: screens[indexPath.row].id)
    }
}
