//
//  UIFont+Scale.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 17.02.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

extension CGFloat {
    func scaledFont() -> CGFloat {
        let ratio = UIScreen.main.bounds.size.height / 812
        let scaledFontSize = self * ratio
        return scaledFontSize
    }
}
