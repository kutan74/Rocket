//
//  AuthenticateWithZeplinViewController.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 5.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class AuthenticateWithZeplinViewController: UIViewController {
    private let subView = AuthenticateWithZeplinView()
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        layoutViews()
    }
}

// MARK: Constraints

extension AuthenticateWithZeplinViewController {
    func layoutViews() {
        view.addSubview(subView)
        subView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor,
                       bottom: view.bottomAnchor, traling: view.trailingAnchor)
        
        let connectToZeplinTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleConnectToZeplinButtonAction))
        subView.connectToZeplinButton.addGestureRecognizer(connectToZeplinTapGesture)
    }
}

// MARK: Tap Actions

extension AuthenticateWithZeplinViewController {
    @objc func handleConnectToZeplinButtonAction() {

    }
}
