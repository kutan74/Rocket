//
//  RocketService.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 26.02.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation
import Moya

enum RocketService {
    case projects
    case projectScreens(projectId: String)
}

extension RocketService: TargetType, AccessTokenAuthorizable {
    var baseURL: URL { return URL(string: "https://api.zeplin.dev/v1")! }
    var path: String {
        switch self {
        case .projects:
            return "projects"
        case .projectScreens(let projectId):
            return "projects/\(projectId)/screens/5e43fd33cf17278c82c818c7/versions/5e43fd33cf17278c82c818c8"
        }
    }
    var method: Moya.Method {
        switch self {
        case .projects:
            return .get
        case .projectScreens(_):
            return .get
        }
    }
    var task: Task {
        switch self {
        case .projects:
            return .requestPlain
        case .projectScreens(_):
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .projects:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        default:
            return "".utf8Encoded
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var authorizationType: AuthorizationType? {
        switch self {
        default:
            return .bearer
            }
        }
    
    
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
