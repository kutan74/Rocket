//
//  CanvasViewController.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 17.02.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {    
    private let subView = CanvasView()
    
    private var currentSelectedCanvasElement: Scaleable?
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .darkGray
        
        layoutViews()
    }
}

// MARK: Subview's Constraints

extension CanvasViewController {
    func layoutViews() {
        view.addSubview(subView)
        subView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor,
                       bottom: view.bottomAnchor, traling: view.trailingAnchor)
        subView.canvasElementsView.rectangleView.button.addTarget(self,
                                                                  action: #selector(handleDrawRectangleButtonTap),
                                                                  for: .touchUpInside)
    }
}

extension CanvasViewController {
    @objc func handleEmptyTouchAround() {
        
    }
}

// MARK: Canvas Button Actions

extension CanvasViewController {
    @objc func handleDrawRectangleButtonTap() {
        let rectangle = CanvasRectangle()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCanvasElementSelection))
        rectangle.isUserInteractionEnabled = true
        rectangle.addGestureRecognizer(tapGesture)
           
        subView.addSubview(rectangle)
        rectangle.anchor(top: nil, leading: nil, bottom: nil, traling: subView.artboardView.leadingAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: 50),
                         size: .init(width: 100, height: 100))
        rectangle.centerY(of: subView.artboardView.centerYAnchor)
    }
}

// MARK: Canvas Element Selection

extension CanvasViewController {
    @objc func handleCanvasElementSelection(_ sender: UITapGestureRecognizer) {
        guard let view = sender.view else {
            return
        }
        
        guard let scaleableView = view as? Scaleable else {
            return
        }
        
        currentSelectedCanvasElement = scaleableView
        scaleableView.enableScalePoints()
    }
}

