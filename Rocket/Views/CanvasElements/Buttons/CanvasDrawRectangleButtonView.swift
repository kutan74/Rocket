//
//  CanvasRectangle.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 17.02.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class CanvasDrawRectangleButtonView: UIView {
    let button: UIButton = {
        let button = UIButton()
        button.setTitle(" Rectangle ", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        return button
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

extension CanvasDrawRectangleButtonView {
    func layoutViews() {
        [button].forEach {
            addSubview($0)
        }
        
        button.anchor(top: topAnchor, leading: leadingAnchor,
                      bottom: bottomAnchor, traling: trailingAnchor,
                      padding: .zero,
                      size: .init(width: 100, height: 50))
    }
}

