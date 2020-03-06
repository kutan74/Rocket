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
    private let zeplinAuthHandler = ZeplinOauthHandler()
    
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

extension AuthenticateWithZeplinViewController: ZeplinOauthHandlerDelegate {
    @objc func handleConnectToZeplinButtonAction() {
        addChild(zeplinAuthHandler)
        zeplinAuthHandler.delegate = self
        zeplinAuthHandler.getZeplinAccessToken()
    }
    
    func didReceiveAccessToken(accessToken: String) {
        let controller = ZeplinSelectProjectViewController(accessToken: accessToken)
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
}
