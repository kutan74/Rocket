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
    case screenVersion(projectId: String,screenId: String)
    case screen(projectId: String, screenId: String, screenVersionId: String)
}

extension RocketService: TargetType, AccessTokenAuthorizable {
    var baseURL: URL { return URL(string: "https://api.zeplin.dev/v1")! }
    var path: String {
        switch self {
        case .projects:
            return "projects"
        case .projectScreens(let projectId):
            return "projects/\(projectId)/screens"
        case .screenVersion(let projectId, let screenId):
            return "projects/\(projectId)/screens/\(screenId)/versions"
        case .screen(let projectId, let screenId, let screenVersionId):
            return "projects/\(projectId)/screens/\(screenId)/versions/\(screenVersionId)"
        }
    }
    var method: Moya.Method {
        switch self {
        case .projects:
            return .get
        case .projectScreens(_), .screenVersion(_, _), .screen(_, _, _):
            return .get
        }
    }
    var task: Task {
        switch self {
        case .projects:
            return .requestPlain
        case .projectScreens(_), .screenVersion(_, _), .screen(_, _, _):
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
