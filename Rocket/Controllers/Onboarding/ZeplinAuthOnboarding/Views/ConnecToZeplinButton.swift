//
//  ConnecToZeplinButton.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 5.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ConnectToZeplinButton: UIView {
    let zeplinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zeplinImage")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let buttonTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Connect to Zeplin"
        label.textColor = .greyishBrown
        label.font = .systemFont(ofSize: 32, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
    
}

extension ConnectToZeplinButton {
    func layoutViews() {
        [zeplinImageView, buttonTitleLabel].forEach {
            addSubview($0)
        }
        
        zeplinImageView.anchor(top: nil, leading: leadingAnchor, bottom: nil, traling: nil,
                               padding: .init(top: 9, left: 20, bottom: 9, right: 0),
                               size: .init(width: 58, height: 58))
        zeplinImageView.centerY(of: centerYAnchor)
        buttonTitleLabel.anchor(top: nil, leading: zeplinImageView.trailingAnchor, bottom: nil, traling: trailingAnchor,
                                padding: .init(top: 0, left: 21, bottom: 0, right: 27))
        buttonTitleLabel.centerY(of: centerYAnchor)
    }
}
