//
//  Scaleable.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 18.02.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

// MARK: 8-Way Scaling Points

enum ScalePointDirection {
    case topLeft
    case topCenter
    case topRight
    case leftCenter
    case bottomLeft
    case bottomCenter
    case bottomRight
    case rightCenter
}

protocol Scaleable {
    func enableScalePoints()
    func disableScalePoints()
}

// MARK: Activation & Deactivation of Scaling Points

extension ScaleableView: Scaleable {
    func enableScalePoints() {
        self.onScalePointsActive()
    }
    
    func disableScalePoints() {
        self.onScalePointsDeActive()
    }
}
