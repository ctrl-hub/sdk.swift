// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import Alamofire
import JSONAPI

// MARK: - Routes

enum OrganisationRoutes {
    case all
    case one(String)

    var baseURL: URL {
        // TODO: - this needs to come from Config
        return URL(string: "https://api.ctrl-hub.dev")!
    }
    
    var path: String {
        switch self {
        case .all:
            return "/v3/orgs"
        case .one(let orgId):
            return "/v3/orgs/\(orgId)"
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

extension OrganisationRoutes: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.method = method
        return try URLEncoding.default.encode(request, with: nil)
    }
}

// MARK: - Reponse Data

public enum OrganisationResponseData {
    case success(Organisation)
    case fail(RequestError)
}

public enum OrganisationsResponseData {
    case success([Organisation])
    case fail(RequestError)
}

// MARK: - Interface

public class Organisations {
    
    static public func Get(complete: @escaping @Sendable (OrganisationsResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(OrganisationRoutes.all)
            .validate()
            .response(responseSerializer: OrganisationsSerializer()) { response in
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
    
    static public func Get(orgId: String, complete: @escaping @Sendable (OrganisationResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(OrganisationRoutes.one(orgId))
            .validate()
            .response(responseSerializer: OrganisationSerializer()) { response in
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
