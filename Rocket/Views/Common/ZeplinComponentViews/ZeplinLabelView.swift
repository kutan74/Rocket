//
//  ZeplinLabelView.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 7.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ZeplinLabelView: UIView {
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}

// MARK: Constraints

extension ZeplinLabelView {
    func layoutViews() {
        addSubview(label)
        label.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor)
    }
}
