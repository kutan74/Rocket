//
//  ZeplinSelectComponentsDataLoader.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation
import Moya

struct ZeplinSelectComponentsDataLoader {
    let accessToken: String
    let screenId: String
    let projectId: String
    
    init(accessToken: String, screenId: String, projectId: String) {
        self.accessToken = accessToken
        self.screenId = screenId
        self.projectId = projectId
    }
}

// MARK: Screen Versions

extension ZeplinSelectComponentsDataLoader {
    typealias ScreenVersionsCompletionHandler = (Result<[ZeplinScreenVersion], Error>) -> Void
    
    func screenVersions(then handler: @escaping ScreenVersionsCompletionHandler) {
        let authPlugin = AccessTokenPlugin { _ in self.accessToken }
        
        let provider = MoyaProvider<RocketService>(plugins: [authPlugin])
        provider.request(.screenVersion(projectId: projectId, screenId: screenId)) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                do {
                    let versions = try JSONDecoder().decode([ZeplinScreenVersion].self, from: data)
                    handler(.success(versions))
                } catch {
                    handler(.failure(error))
                }
            case let .failure(error):
                handler(.failure(error))
            }
        }
    }
}

// MARK: Screen

extension ZeplinSelectComponentsDataLoader {
    typealias ScreenCompletionHandler = (Result<ZeplinScreenComponents, Error>) -> Void
    
    func screen(forVersionId id: String, then handler: @escaping ScreenCompletionHandler) {
        let authPlugin = AccessTokenPlugin { _ in self.accessToken }
        
        let provider = MoyaProvider<RocketService>(plugins: [authPlugin])
        provider.request(.screen(projectId: projectId, screenId: screenId, screenVersionId: id)) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                do {
                    let components = try JSONDecoder().decode(ZeplinScreenComponents.self, from: data)
                    handler(.success(components))
                } catch {
                    handler(.failure(error))
                }                
            case let .failure(error):
                handler(.failure(error))
            }
        }
    }
}
