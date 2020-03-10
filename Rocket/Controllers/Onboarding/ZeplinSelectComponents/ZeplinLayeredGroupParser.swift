//
//  ZeplinLayeredGroupParser.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 9.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit


struct ZeplinLayeredGroupParser {
    
}

extension ZeplinLayeredGroupParser {
    func parseComponent(fromComponent component: ZeplinScreenComponents) -> ParentZeplinView {
        let layers = component.layers
        var viewToBeCreated: ParentZeplinView!        
        layers.forEach {
            let parentView = UIView()
            
            guard $0.type == "group" else {
                return
            }
            
            guard let subLayers = $0.layers else {
                return
            }
            
            /// We know the first sub layer is also the parent layer
            let parentItem = subLayers.first!
            parentView.translatesAutoresizingMaskIntoConstraints = false
            parentView.widthAnchor.constraint(equalToConstant: CGFloat(parentItem.rect.width)).isActive = true
            parentView.heightAnchor.constraint(equalToConstant: CGFloat(parentItem.rect.height)).isActive = true
            
            guard let fills = parentItem.fills else {
                return
            }
            
            /// Don't know what multiple fills do, so I'm gonna take the first one for now
            let firstFill = fills.first!
            let fillColor = firstFill.color.fillColor
            parentView.backgroundColor = fillColor
                                    
            viewToBeCreated = ParentZeplinView(parentView: parentView, rect: $0.rect)
        }
        
        return viewToBeCreated
    }
}

struct ParentZeplinView {
    let parentView: UIView!
    let rect: ZeplinLayerRect!
}
