//
//  ZeplinSelectProjectDataLoader.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation
import Moya

struct ZeplinSelectProjectDataLoader {
    let accessToken: String
    
    init(accessToken: String) {
        self.accessToken = accessToken
    }
}

// MARK: Get Projects

extension ZeplinSelectProjectDataLoader {
    typealias GetProjectsCompletionHandler = (Result<[ZeplinProject], Error>) -> Void
    
    func getProjects(then handler: @escaping GetProjectsCompletionHandler) {
        let authPlugin = AccessTokenPlugin { _ in self.accessToken }
        
        let provider = MoyaProvider<RocketService>(plugins: [authPlugin])
        provider.request(.projects) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                do {
                    let projects = try JSONDecoder().decode([ZeplinProject].self, from: data)
                    handler(.success(projects))
                } catch {
                    handler(.failure(error))
                }
            case let .failure(error):
                print("error")
            }
        }
    }
}
