//
//  ZeplinScreenCollectionViewCell.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ZeplinScreenCollectionViewCell: UICollectionViewCell {
    let thumnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit        
        return imageView
    }()

    let screenNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .greyishBrown
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}

// MARK: Constraints

extension ZeplinScreenCollectionViewCell {
    func layoutViews() {
        [thumnailImageView, screenNameLabel].forEach {
            addSubview($0)
        }
        
        thumnailImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor,
                                 padding: .zero,
                                 size: .init(width: 244, height: 390))
        screenNameLabel.anchor(top: thumnailImageView.bottomAnchor, leading: thumnailImageView.leadingAnchor,
                               bottom: nil, traling: nil,
                               padding: .init(top: 17, left: 0, bottom: 0, right: 0))
    }
}
