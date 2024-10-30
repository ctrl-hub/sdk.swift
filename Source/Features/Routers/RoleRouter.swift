//
//  RoleRouter.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import Alamofire
import JSONAPI

// MARK: - Routes

enum RoleRoutes {
    case all
    case one(String)

    var baseURL: URL {
        // TODO: - this needs to come from Config
        return URL(string: "https://api.ctrl-hub.dev")!
    }
    
    var path: String {
        switch self {
        case .all:
            return "/v3/admin/iam/roles"
        case .one(let RoleId):
            return "/v3/admin/iam/roles/\(RoleId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .all:
            return .get
        case .one:
            return .get
        }
    }
}

extension RoleRoutes: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.method = method
        return try URLEncoding.default.encode(request, with: nil)
    }
}

// MARK: - Reponse Data

public enum RoleResponseData {
    case success(Role)
    case fail(RequestError)
}

public enum RolesResponseData {
    case success([Role])
    case fail(RequestError)
}

// MARK: - Interface

public class Roles {
    
    static public func get(complete: @escaping @Sendable (RolesResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(RoleRoutes.all)
            .validate()
            .response(responseSerializer: RolesSerializer()) { response in
                switch response.result {
                case .success:
                    complete(.success(
                        response.value!
                    ))
                case let .failure(error):
                    complete(.fail(RequestError(
                        code: response.response?.statusCode ?? 0,
                        message: error.failureReason ?? "Unknown error"
                    )))
                }
            }
    }
    
    static public func get(roleId: String, complete: @escaping @Sendable (RoleResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(RoleRoutes.one(roleId))
            .validate()
            .response(responseSerializer: RoleSerializer()) { response in
                switch response.result {
                case .success:
                    complete(.success(
                        response.value!
                    ))
                case let .failure(error):
                    complete(.fail(RequestError(
                        code: response.response?.statusCode ?? 0,
                        message: error.failureReason ?? "Unknown error"
                    )))
                }
            }
    }

}
