//
//  CanvasElementsView.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 17.02.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class CanvasElementsView: UIView {
    let rectangleView = CanvasDrawRectangleButtonView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}

// MARK: Constraints

extension CanvasElementsView {
    func layoutViews() {
        [rectangleView].forEach {
            addSubview($0)
        }
        
        rectangleView.anchor(top: topAnchor, leading: leadingAnchor,
                             bottom: bottomAnchor, traling: trailingAnchor,
                             padding: .init(top: 10, left: 10, bottom: 0, right: 0),
                             size: .init(width: 100, height: 50))
    }
}
