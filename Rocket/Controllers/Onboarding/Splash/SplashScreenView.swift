//
//  SplashScreenView.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 5.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class SplashScreenView: UIView {
    let title: UILabel = {
        let label = UILabel()
        label.text = "Let"
        label.font = .systemFont(ofSize: 100, weight: .bold)
        label.textColor = .greyishBrown
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.text = "let designers actually use the iPad"
        label.font = .systemFont(ofSize: 32, weight: .light)
        label.textColor = .black
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

extension SplashScreenView {
    func layoutViews() {
        [title, subTitle].forEach {
            addSubview($0)
        }
        
        title.centerX(of: centerXAnchor)
        title.centerY(of: centerYAnchor)
        
        subTitle.centerX(of: centerXAnchor)
        subTitle.anchor(top: title.bottomAnchor, leading: nil, bottom: nil, traling: nil,
                        padding: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
}
