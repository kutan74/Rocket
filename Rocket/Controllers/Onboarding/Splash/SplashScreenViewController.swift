//
//  SplashScreenViewController.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 5.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
    private let subView = SplashScreenView()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(subView)
        layoutViews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let controller = AuthenticateWithZeplinViewController()
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }
}

// MARK: Constraints

extension SplashScreenViewController {
    func layoutViews() {
        view.addSubview(subView)
        
        subView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor,
                       bottom: view.bottomAnchor, traling: view.trailingAnchor)
    }
}
