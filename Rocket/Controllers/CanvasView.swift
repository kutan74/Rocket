//
//  CanvasView.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 17.02.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    let canvasElementsView = CanvasElementsView()
    let artboardView = ArtboardView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}

// MARK: Constraints

extension CanvasView {
    func layoutViews() {
        [canvasElementsView, artboardView].forEach {
            addSubview($0)
        }
        
        canvasElementsView.anchor(top: topAnchor, leading: leadingAnchor,
                                  bottom: nil, traling: nil)
        
        artboardView.centerX(of: centerXAnchor)
        artboardView.centerY(of: centerYAnchor)
        artboardView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        artboardView.heightAnchor.constraint(equalToConstant: 812).isActive = true
    }
}
