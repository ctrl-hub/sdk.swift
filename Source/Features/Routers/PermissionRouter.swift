// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import Alamofire
import JSONAPI

// MARK: - Routes

enum PermissionRoutes {
    case all
    case one(String)

    var baseURL: URL {
        // TODO: - this needs to come from Config
        return URL(string: "https://api.ctrl-hub.dev")!
    }
    
    var path: String {
        switch self {
        case .all:
            return "/v3/admin/iam/permissions"
        case .one(let permissionId):
            return "/v3/admin/iam/permissions/\(permissionId)"
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

extension PermissionRoutes: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.method = method
        return try URLEncoding.default.encode(request, with: nil)
    }
}

// MARK: - Reponse Data

public enum PermissionResponseData {
    case success(Permission)
    case fail(RequestError)
}

public enum PermissionsResponseData {
    case success([Permission])
    case fail(RequestError)
}

// MARK: - Interface

public class Permissions {
    
    static public func Get(complete: @escaping @Sendable (PermissionsResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(PermissionRoutes.all)
            .validate()
            .response(responseSerializer: PermissionsSerializer()) { response in
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
    
    static public func Get(permissionId: String, complete: @escaping @Sendable (PermissionResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(PermissionRoutes.one(permissionId))
            .validate()
            .response(responseSerializer: PermissionSerializer()) { response in
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
