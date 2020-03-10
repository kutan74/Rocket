//
//  Networking.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 9.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation
import OAuthSwift
import Moya

struct Networking {
    private let oauthClient: OAuthSwift!
    
    init(oauthClient: OAuthSwift) {
        self.oauthClient = oauthClient
    }
}

extension Networking {
    func getAccessToken() {
        
    }
    
    func refreshAccessToken() {
        
    }
}

extension Networking {
    func saveCredentials() {
        
    }
}
