//
//  StreetRouter.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import Alamofire
import JSONAPI

// MARK: - Routes

enum StreetRoutes {
    case all
    case one(String)

    var baseURL: URL {
        // TODO: - this needs to come from Config
        return URL(string: "https://api.ctrl-hub.dev")!
    }
    
    var path: String {
        switch self {
        case .all:
            return "/v3/governance/streets"
        case .one(let streetId):
            return "/v3/governance/streets/\(streetId)"
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

extension StreetRoutes: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.method = method
        return try URLEncoding.default.encode(request, with: nil)
    }
}

// MARK: - Reponse Data

public enum StreetResponseData {
    case success(Street)
    case fail(RequestError)
}

public enum StreetsResponseData {
    case success([Street])
    case fail(RequestError)
}

// MARK: - Interface

public class Streets {
    
    static public func get(complete: @escaping @Sendable (StreetsResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(StreetRoutes.all)
            .validate()
            .response(responseSerializer: StreetsSerializer()) { response in
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
    
    static public func get(propertyId: String, complete: @escaping @Sendable (StreetResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(StreetRoutes.one(propertyId))
            .validate()
            .response(responseSerializer: StreetSerializer()) { response in
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
