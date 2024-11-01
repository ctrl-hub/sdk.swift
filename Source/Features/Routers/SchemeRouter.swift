// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import Alamofire
import JSONAPI

// MARK: - Routes

enum SchemeRoutes {
    case all(String)
    case one(String, String)

    var baseURL: URL {
        // TODO: - this needs to come from Config
        return URL(string: "https://api.ctrl-hub.dev")!
    }
    
    var path: String {
        switch self {
        case .all(let orgId):
            return "/v3/orgs/\(orgId)/governance/schemes"
        case .one(let orgId, let schemeId):
            return "/v3/orgs/\(orgId)/governance/schemes/\(schemeId)"
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

extension SchemeRoutes: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.method = method
        return try URLEncoding.default.encode(request, with: nil)
    }
}

// MARK: - Reponse Data

public enum SchemeResponseData {
    case success(Scheme)
    case fail(RequestError)
}

public enum SchemesResponseData {
    case success([Scheme])
    case fail(RequestError)
}

// MARK: - Interface

public class Schemes {
    
    static public func Get(orgId: String, complete: @escaping @Sendable (SchemesResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(SchemeRoutes.all(orgId))
            .validate()
            .response(responseSerializer: SchemesSerializer()) { response in
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
    
    static public func Get(orgId: String, schemeId: String, complete: @escaping @Sendable (SchemeResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(SchemeRoutes.one(orgId, schemeId))
            .validate()
            .response(responseSerializer: SchemeSerializer()) { response in
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
