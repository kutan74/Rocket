//
//  ZeplinSelectScreenDataLoader.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation
import Moya

struct ZeplinSelectScreenDataLoader {
    let projectId: String
    let accessToken: String
    
    init(projectId: String, accessToken: String) {
        self.projectId = projectId
        self.accessToken = accessToken
    }
}

// MARK: /screens

extension ZeplinSelectScreenDataLoader {
    typealias ProjectScreensCompletionHandler = (Result<[ZeplinScreen], Error>) -> Void
    
    func projectScreens(then handler: @escaping ProjectScreensCompletionHandler) {
        let authPlugin = AccessTokenPlugin { _ in self.accessToken }
        
        let provider = MoyaProvider<RocketService>(plugins: [authPlugin])
        provider.request(.projectScreens(projectId: self.projectId)) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                do {
                    let screens = try JSONDecoder().decode([ZeplinScreen].self, from: data)
                    handler(.success(screens))
                } catch {
                    handler(.failure(error))
                }
            case let .failure(error):
                handler(.failure(error))
            }
        }
    }
}
