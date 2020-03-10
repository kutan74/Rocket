//
//  ZeplinSelectComponentsDataSource.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ZeplinSelectComponentsDataSource: NSObject {
    var components: [UIView]
    
    init(components: [UIView]) {
        self.components = components
    }
}

// MARK: CollectionView Delegate & DataSource

extension ZeplinSelectComponentsDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return components.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ZeplinComponentCollectionViewCell
        let component = components[indexPath.row]
        cell.component = component
        return cell
    }
}
