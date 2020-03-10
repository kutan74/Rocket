//
//  ZeplinComponentCollectionViewCell.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ZeplinComponentCollectionViewCell: UICollectionViewCell {
    var component: UIView! {
        didSet {
            layoutComponent()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
}

extension ZeplinComponentCollectionViewCell {
    func layoutComponent() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(component)
        
        component.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor,
                    bottom: nil, traling: contentView.trailingAnchor)
        
        /// Making sure the bottom constraint of ContentView is equal to bottom constarint of the parent view
        contentView.bottomAnchor.constraint(equalTo: component.bottomAnchor).isActive = true
    }
}
