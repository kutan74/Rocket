//
//  ReusableDataSource.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 7.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

/**
 Reusable UICollectionView Datasource
 */
class TWReusableDataSource<Model>: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    /// Typealias the represent cellType and the UICollectionViewCell
    typealias CellConfigurator = (Model, UICollectionViewCell) -> Void
    
    /// Typealias to represent cell selection
    typealias CellSelection = (Model) -> Void
    
    var models: [Model]
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    private let cellSelection: CellSelection
    
    /**
     Configures the DataSource
     - Parameter models: Generic array of objects
     - Parameter reuseIdentifier: UICollectionView cell identifier
     - Parameter cellConfigurator: Typalieas as a cell configuration closure
     - Parameter cellSelection: Typealias as cell selection closure
    */
    init(models: [Model],
         reuseIdentifier: String,
         cellConfigurator: @escaping CellConfigurator,
         cellSelection: @escaping CellSelection) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
        self.cellSelection = cellSelection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let model = models[indexPath.row]
        
        cellConfigurator(model, cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellSelection(models[indexPath.row])
    }
}
