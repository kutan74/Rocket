//
//  CanvasRectangle.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 18.02.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class CanvasRectangle: ScaleableView {
    private var panGesture = UIPanGestureRecognizer()
    private var initialCenter = CGPoint()
    private var previousPosition: CGPoint!
    
    private var isScaling = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        configurePanGesture()
        configureScaleGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}

// MARK: Pan Gesture

extension CanvasRectangle {
    func configurePanGesture() {
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(panPiece(_:)))
        addGestureRecognizer(panGesture)
    }
    
    func configureScaleGestures() {
        [topLeftScalePoint, topCenterScalePoint, topRightScalePoint,
        leftCenterScalePoint, bottomLeftScalePoint, bottomCenterScalePoint,
        bottomRightScalePoint, rightCenterScalePoint].forEach {
            let tapGestureRecognizer = SingleTouchDownGestureRecognizer(target: self, action: #selector(viewWasTapped(sender:)))
            $0.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    @objc func panPiece(_ gestureRecognizer : UIPanGestureRecognizer) {
           guard gestureRecognizer.view != nil, !isScaling else {
               return
           }
           
           let piece = gestureRecognizer.view!
           let translation = gestureRecognizer.translation(in: piece.superview)
           if gestureRecognizer.state == .began {
               self.initialCenter = piece.center
           }
           if gestureRecognizer.state != .cancelled {
               let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
               piece.center = newCenter
           }
           else {
               //piece.center = initialCenter
           }
       }
}

extension CanvasRectangle {
    @objc func viewWasTapped(sender: UITapGestureRecognizer) {
        guard let view = sender.view else {
            return
        }
        
        guard let scalePoint = view as? ScalePoint else {
            return
        }
        
        /// Prevent moving while scaling
        isScaling = true
        
        let point = sender.location(in: self)
        print(point.y * 0.0001)
        switch sender.state {
        case .began:
            if previousPosition == nil {
                previousPosition = point
            }
        case .changed:
            if point == previousPosition {
                return
            }
            
            if scalePoint.pointDirection! == .topCenter {
                if point.y < previousPosition.y {
                    let originalTransform = transform
                    let scaledTransform = originalTransform.scaledBy(x: 1.0, y: 1.011)
                    let translatedTransform = scaledTransform.translatedBy(x: 0, y: -1.011 / 2)
                    transform = translatedTransform
                } else {
                    let originalTransform = transform
                    let scaledTransform = originalTransform.scaledBy(x: 1.0, y: 0.991)
                    let translatedTransform = scaledTransform.translatedBy(x: 0, y: 0.991 / 2)
                    transform = translatedTransform
                }
            }
            
            /*
            if point.x > previousPosition.x {
                let originalTransform = transform
                let scaledTransform = originalTransform.scaledBy(x: 1.009, y: 1.009)
                //transform = scaledTransform
            } else if point.x < previousPosition.x {
                let originalTransform = transform
                let scaledTransform = originalTransform.scaledBy(x: 0.991, y: 0.991)
                //transform = scaledTransform
            }
            */
            previousPosition = point
        case .ended:
            previousPosition = point
            isScaling = false
        default:
            break
        }
    }
}

class SingleTouchDownGestureRecognizer: UIGestureRecognizer {
    var wasSwiped = false

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {

        guard let view = self.view else { return }
        guard let touches = event.touches(for: view) else { return } // 1. compare that event in touchesBegan has touches for the view that is the same as the view to which your gesture recognizer was assigned

        if touches.first != nil {
            self.state = .began
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {

        guard let touch = touches.first else { return }

        let newLocation = touch.location(in: self.view)
        let previousLocation = touch.previousLocation(in: self.view)
                
        self.state = .changed
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        self.state = .ended
    }
}
