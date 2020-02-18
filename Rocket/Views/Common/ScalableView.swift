//
//  ScalableView.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 18.02.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ScaleableView: UIView {
    let scalePointWidth: CGFloat = 15.0
    let scalePointHeight: CGFloat = 15.0
    let marginConstant: CGFloat = 3.0
    
    let topLeftScalePoint = ScalePoint(pointDirection: .topLeft)
    let topCenterScalePoint = ScalePoint(pointDirection: .topCenter)
    let topRightScalePoint = ScalePoint(pointDirection: .topRight)
    let leftCenterScalePoint = ScalePoint(pointDirection: .leftCenter)
    let bottomLeftScalePoint = ScalePoint(pointDirection: .bottomLeft)
    let bottomCenterScalePoint = ScalePoint(pointDirection: .bottomCenter)
    let bottomRightScalePoint = ScalePoint(pointDirection: .bottomRight)
    let rightCenterScalePoint = ScalePoint(pointDirection: .rightCenter)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureScalePoints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}

// MARK: Scale Point Configurations

extension ScaleableView {
    func configureScalePoints() {
        [topLeftScalePoint, topCenterScalePoint, topRightScalePoint,
         leftCenterScalePoint, bottomLeftScalePoint, bottomCenterScalePoint,
         bottomRightScalePoint, rightCenterScalePoint].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: scalePointWidth).isActive = true
            $0.heightAnchor.constraint(equalToConstant: scalePointHeight).isActive = true
            $0.isHidden = true
            self.bringSubviewToFront($0)
        }
        
        /// Top left
        topLeftScalePoint.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, traling: nil,
                                 padding: .init(top: -marginConstant, left: -marginConstant, bottom: 0, right: 0))
        
        /// Top center
        topCenterScalePoint.centerX(of: centerXAnchor)
        topCenterScalePoint.centerY(of: topLeftScalePoint.centerYAnchor)
        
        /// Top right
        topRightScalePoint.anchor(top: nil, leading: nil, bottom: nil, traling: trailingAnchor,
                                  padding: .init(top: 0, left: 0, bottom: 0, right: -marginConstant))
        topRightScalePoint.centerY(of: topLeftScalePoint.centerYAnchor)
        
        /// Left center
        leftCenterScalePoint.centerX(of: topLeftScalePoint.centerXAnchor)
        leftCenterScalePoint.centerY(of: centerYAnchor)
        
        /// Bottom Left
        bottomLeftScalePoint.anchor(top: nil, leading: nil, bottom: bottomAnchor, traling: nil,
                                    padding: .init(top: 0, left: 0, bottom: -marginConstant, right: 0))
        bottomLeftScalePoint.centerX(of: topLeftScalePoint.centerXAnchor)
        
        /// Bottom center
        bottomCenterScalePoint.centerX(of: centerXAnchor)
        bottomCenterScalePoint.centerY(of: bottomLeftScalePoint.centerYAnchor)
        
        /// Bottom right
        bottomRightScalePoint.centerY(of: bottomCenterScalePoint.centerYAnchor)
        bottomRightScalePoint.centerX(of: topRightScalePoint.centerXAnchor)
        
        /// Right center
        rightCenterScalePoint.centerX(of: topRightScalePoint.centerXAnchor)
        rightCenterScalePoint.centerY(of: centerYAnchor)
    }
}

extension ScaleableView {
    func onScalePointsActive() {
        [topLeftScalePoint, topCenterScalePoint, topRightScalePoint,
         leftCenterScalePoint, bottomLeftScalePoint, bottomCenterScalePoint,
         bottomRightScalePoint, rightCenterScalePoint].forEach {
            $0.isHidden = false
        }
    }
    
    func onScalePointsDeActive() {
        [topLeftScalePoint, topCenterScalePoint, topRightScalePoint,
         leftCenterScalePoint, bottomLeftScalePoint, bottomCenterScalePoint,
         bottomRightScalePoint, rightCenterScalePoint].forEach {
            $0.isHidden = true
        }
    }
}
