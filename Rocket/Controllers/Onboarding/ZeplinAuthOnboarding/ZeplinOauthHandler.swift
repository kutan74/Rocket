//
//  ZeplinOauthHandler.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 5.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit
import OAuthSwift

protocol ZeplinOauthHandlerDelegate: class {
    func didReceiveAccessToken(accessToken: String)
}

class ZeplinOauthHandler: UIViewController {
    private var oauthswift: OAuthSwift!
    weak var delegate: ZeplinOauthHandlerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Zeplin Access Token

extension ZeplinOauthHandler {
    func getZeplinAccessToken() {
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
                        
        let _ = oauthswift.authorize(
            withCallbackURL: URL(string: "com.rocket.app.Rocket://zeplin-auth")!,
            scope: "",
            state: state) { result in
                switch result {
                case .success(let (credential, _, _)):
                    self.remove()
                    self.delegate?.didReceiveAccessToken(accessToken: credential.oauthToken)
                case .failure(let error):
                    print(error.description)
                }
        }
    }
    
    func getURLHandler() -> OAuthSwiftURLHandlerType {
        return OAuthSwiftOpenURLExternally.sharedInstance
    }
}
