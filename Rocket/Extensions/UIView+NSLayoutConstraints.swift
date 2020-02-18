//
//  UIView+NSLayoutConstraints.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 17.02.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

extension UIView {
    /**
     Layouts a view to given anchors
     
     Example
     - image.anchor(top: transactionActionView.bottomAnchor, leading: leadingAnchor,
     bottom: bottomAnchor, traling: trailingAnchor,
     padding: .init(top: 4, left: 30, bottom: 0, right: 30))
     
     - Parameter top        : Top anchor the view being aligned
     - Parameter leading    : Leading anchor the view being aligned
     - Parameter bottom     : Bottom anchor the view being aligned
     - Parameter trailing   : Trailing anchor the view being aligned
     
     - Parameter padding    : Padding of the view being aligned
     - Parameter size       : Size of the view being aligned
     
     */
    func anchor(top : NSLayoutYAxisAnchor?,
                leading : NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                traling : NSLayoutXAxisAnchor?,
                padding : UIEdgeInsets = .zero,
                size : CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant : padding.top.scaledFont()).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant : padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant : -padding.bottom.scaledFont()).isActive = true
        }
        if let traling = traling {
            trailingAnchor.constraint(equalTo: traling, constant : -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    
    /**
     Centers the UIView to x axis of the given anchor
     Equals to imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
     
     - Parameter anchor     : Center X anchor the view being aligned
     */
    func centerX(of anchor: NSLayoutXAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    /**
     Centers the UIView to y axis of the given anchor
     Equals to imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
     
     - Parameter anchor     : Center Y anchor the view being aligned
     */
    func centerY(of anchor: NSLayoutYAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: anchor).isActive = true
    }
}
