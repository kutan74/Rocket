//
//  ZeplinSelectProjectDataSource.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit
import Kingfisher

protocol ZeplinSelectProjectDataSourceDelegate: class {
    func didSelectProject(forId id: String)
}

class ZeplinSelectProjectDataSource: NSObject {
    var projects: [ZeplinProject]!
    weak var delegate: ZeplinSelectProjectDataSourceDelegate?
    
    init(projects: [ZeplinProject]) {
        self.projects = projects
    }
}

// MARK: ColellectionView Delegate & DataSource

extension ZeplinSelectProjectDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ZeplinProjectCollectionViewCell
        
        let project = projects[indexPath.row]
        
        if let thumnail = project.thumbnail {
            cell.thumnailImageView.kf.setImage(with: URL(string: thumnail))
        }
        
        cell.projectTitleLabel.text = project.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectProject(forId: projects[indexPath.row].id)
    }
}

