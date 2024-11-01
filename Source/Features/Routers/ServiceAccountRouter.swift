//
//  ServiceAccountRouter.swift
//  CtrlHub
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import Alamofire
import JSONAPI

// MARK: - Routes

enum ServiceAccountRoutes {
    case all(String)
    case one(String, String)
    case logs(String, String)
    case log(String, String, String)

    var baseURL: URL {
        // TODO: - this needs to come from Config
        return URL(string: "https://api.ctrl-hub.dev")!
    }

    var path: String {
        switch self {
        case .all(let orgId):
            return "/v3/orgs/\(orgId)/admin/iam/service-accounts"
        case .one(let orgId, let serviceAccountId):
            return "/v3/orgs/\(orgId)/admin/iam/service-accounts/\(serviceAccountId)"
        case .logs(let orgId, let serviceAccountId):
            return "/v3/orgs/\(orgId)/admin/iam/service-accounts/\(serviceAccountId)/logs"
        case .log(let orgId, let serviceAccountId, let logId):
            return "/v3/orgs/\(orgId)/admin/iam/service-accounts/\(serviceAccountId)/logs/\(logId)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .all:
            return .get
        case .one:
            return .get
        case .logs:
            return .get
        case .log:
            return .get
        }
    }
}

extension ServiceAccountRoutes: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.method = method
        return try URLEncoding.default.encode(request, with: nil)
    }
}

// MARK: - Reponse Data

public enum ServiceAccountResponseData {
    case success(ServiceAccount)
    case fail(RequestError)
}

public enum ServiceAccountsResponseData {
    case success([ServiceAccount])
    case fail(RequestError)
}

public enum RequestLogResponseData {
    case success(RequestLog)
    case fail(RequestError)
}

public enum RequestLogsResponseData {
    case success([RequestLog])
    case fail(RequestError)
}

// MARK: - Interface

public class ServiceAccounts {

    static public func Get(orgId: String, complete: @escaping @Sendable (ServiceAccountsResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(ServiceAccountRoutes.all(orgId))
            .validate()
            .response(responseSerializer: ServiceAccountsSerializer()) { response in
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

    static public func Get(orgId: String, serviceAccountId: String, complete: @escaping @Sendable (ServiceAccountResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(ServiceAccountRoutes.one(orgId, serviceAccountId))
            .validate()
            .response(responseSerializer: ServiceAccountSerializer()) { response in
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

    static public func Logs(orgId: String, serviceAccountId: String, complete: @escaping @Sendable (RequestLogsResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(ServiceAccountRoutes.logs(orgId, serviceAccountId))
            .validate()
            .response(responseSerializer: RequestLogsSerializer()) { response in
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

    static public func Log(orgId: String, serviceAccountId: String, logId: String, complete: @escaping @Sendable (RequestLogResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(ServiceAccountRoutes.log(orgId, serviceAccountId, logId))
            .validate()
            .response(responseSerializer: RequestLogSerializer()) { response in
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
