//
//  ZeplinProjectCollectionViewCell.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ZeplinProjectCollectionViewCell: UICollectionViewCell {
    var thumnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let projectTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .greyishBrown
        label.font = .systemFont(ofSize: 32, weight: .regular)
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

extension ZeplinProjectCollectionViewCell {
    func layoutViews() {
        [thumnailImageView, projectTitleLabel].forEach {
            addSubview($0)
        }
        
        thumnailImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: trailingAnchor,
                                 padding: .zero,
                                 size: .init(width: 150, height: 150))
        projectTitleLabel.anchor(top: thumnailImageView.bottomAnchor, leading: thumnailImageView.leadingAnchor,
                                 bottom: nil, traling: nil,
                                 padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
}
