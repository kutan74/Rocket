//
//  ZeplinSelectComponentsView.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ZeplinSelectComponentsView: UIView {
    let title: UILabel = {
        let label = UILabel()
        label.text = "Let"
        label.font = .systemFont(ofSize: 100, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Canvas"
        label.textColor = .white
        label.font = .systemFont(ofSize: 32, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var collectionView: UICollectionView!
    var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .zero
        layout.estimatedItemSize = .init(width: 500, height: 500)
        layout.minimumLineSpacing = 50
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = .zero
        return layout
    }()
    
    let artboardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blackBg
        layoutViews()
        layoutCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}

// MARK: Constraints

extension ZeplinSelectComponentsView {
    func layoutViews() {
        [title, subTitleLabel, artboardView].forEach {
            addSubview($0)
        }
        
        title.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: nil,
                     padding: .init(top: 48, left: 53, bottom: 0, right: 0))
        
        subTitleLabel.anchor(top: title.bottomAnchor, leading: title.leadingAnchor,
                             bottom: nil, traling: nil,
                             padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        subTitleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
        
        artboardView.centerX(of: centerXAnchor)
        artboardView.centerY(of: centerYAnchor)
        artboardView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        artboardView.heightAnchor.constraint(equalToConstant: 812).isActive = true
    }
}

// MARK: CollectionView Layout

extension ZeplinSelectComponentsView {
    func layoutCollectionView() {
        collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView.register(ZeplinComponentCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.anchor(top: subTitleLabel.bottomAnchor, leading: title.leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor,
                              padding: .init(top: 89, left: 0, bottom: 0, right: 0),
                              size: .init(width: 0, height: 0))
    }
}
