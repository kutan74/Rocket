//
//  ScalePoint.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 18.02.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit


// MARK: ScalePoint

class ScalePoint: UIView {
    var pointDirection: ScalePointDirection!
    
    init(pointDirection: ScalePointDirection) {
        self.pointDirection = pointDirection
        super.init(frame: .zero)
        layoutViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
    
    func layoutViews() {
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dropShadow()
    }
}



