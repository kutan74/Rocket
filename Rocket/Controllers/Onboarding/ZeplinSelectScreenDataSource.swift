//
//  ZeplinSelectScreenDataSource.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ZeplinSelectScreenDataSource: NSObject {
    var screens: [ZeplinScreen]
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}
