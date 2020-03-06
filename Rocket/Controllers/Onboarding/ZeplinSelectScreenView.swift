//
//  ZeplinSelectScreenView.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ZeplinSelectScreenView: UIView {
    let title: UILabel = {
        let label = UILabel()
        label.text = "Let"
        label.font = .systemFont(ofSize: 100, weight: .bold)
        label.textColor = .greyishBrown
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Now it’s time to import a screen"
        label.textColor = .greyishBrown
        label.font = .systemFont(ofSize: 32, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var collectionView: UICollectionView!
    var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 244, height: 390)
        layout.minimumLineSpacing = 50
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = .zero
        return layout
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
        layoutCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}

// MARK: Constraints

extension ZeplinSelectScreenView {
    func layoutViews() {
        [title, subTitleLabel].forEach {
            addSubview($0)
        }
        
        title.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: nil,
                     padding: .init(top: 48, left: 53, bottom: 0, right: 0))
        
        subTitleLabel.anchor(top: title.bottomAnchor, leading: title.leadingAnchor,
                             bottom: nil, traling: nil,
                             padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        subTitleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
    }
}

extension ZeplinSelectScreenView {
    func layoutCollectionView() {
        collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView.register(ZeplinProjectCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.anchor(top: subTitleLabel.bottomAnchor, leading: title.leadingAnchor, bottom: nil, traling: trailingAnchor,
                              padding: .init(top: 89, left: 0, bottom: 0, right: 0),
                              size: .init(width: 0, height: 217))
    }
}
