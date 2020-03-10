//
//  CanvasViewController.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 17.02.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit
import WebKit
import Moya
import OAuthSwift

class CanvasViewController: UIViewController {    
    private let subView = CanvasView()
    private var currentSelectedCanvasElement: Scaleable?
    private var webView: WKWebView!
    
    private var oauthswift: OAuthSwift!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .darkGray
        
        layoutViews()
        
        getAuthToken()
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

// MARK: Network

extension CanvasViewController {
    func authZeplin() {
        let authCode = oauthswift.client.credential.oauthToken
        let token = authCode
        let authPlugin = AccessTokenPlugin { _ in token }
        
        let provider = MoyaProvider<RocketService>(plugins: [authPlugin])
        provider.request(.projects) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                self.getProjectScreens()
            case let .failure(error):
                print("error")
            }
        }
    }
    
    func getProjectScreens() {
        let authCode = oauthswift.client.credential.oauthToken
        let token = authCode
        let authPlugin = AccessTokenPlugin { _ in token }
        
        let provider = MoyaProvider<RocketService>(plugins: [authPlugin])
        provider.request(.projectScreens(projectId: "5e2d78e136436754bc9b931f")) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                
            case let .failure(error):
                print("error")
            }
        }
    }
    
    func getAuthToken() {
        let oauthswift = OAuth2Swift(
            consumerKey:    "5e566b3c6fd68073c489d5a0",
            consumerSecret: "4ffda85495a941e350b4c9a1f15ce26c1f7562db3a18750832b2bfaf5fa52de4",
            authorizeUrl:   "https://api.zeplin.dev/v1/oauth/authorize",
            accessTokenUrl: "https://api.zeplin.dev/v1/oauth/token",
            responseType:   "code"
        )
        self.oauthswift = oauthswift
        oauthswift.authorizeURLHandler = getURLHandler()
        let state = generateState(withLength: 20)
        
        //oauthswift.client.credential.isTokenExpired()
        
        let _ = oauthswift.authorize(
            withCallbackURL: URL(string: "com.rocket.app.Rocket://zeplin-auth")!,
            scope: "",
            state: state) { result in
                switch result {
                case .success(let (credential, _, _)):
                    print("zeplin auth token: \(credential.oauthToken)")
                    self.authZeplin()
                case .failure(let error):
                    print(error.description)
                }
        }
    }
    
    
    
    func getURLHandler() -> OAuthSwiftURLHandlerType {
        return OAuthSwiftOpenURLExternally.sharedInstance
    }
}

extension CanvasViewController: WKNavigationDelegate {
    
}
