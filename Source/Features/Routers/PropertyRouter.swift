//
//  PropertyRouter.swift
//  CtrlHub
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import Alamofire
import JSONAPI

// MARK: - Routes

enum PropertyRoutes {
    case all
    case one(String)

    var baseURL: URL {
        // TODO: - this needs to come from Config
        return URL(string: "https://api.ctrl-hub.dev")!
    }
    
    var path: String {
        switch self {
        case .all:
            return "/v3/governance/properties"
        case .one(let propertyId):
            return "/v3/governance/properties/\(propertyId)"
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

extension PropertyRoutes: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.method = method
        return try URLEncoding.default.encode(request, with: nil)
    }
}

// MARK: - Reponse Data

public enum PropertyResponseData {
    case success(Property)
    case fail(RequestError)
}

public enum PropertiesResponseData {
    case success([Property])
    case fail(RequestError)
}

// MARK: - Interface

public class Properties {
    
    static public func Get(complete: @escaping @Sendable (PropertiesResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(PropertyRoutes.all)
            .validate()
            .response(responseSerializer: PropertiesSerializer()) { response in
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
    
    static public func Get(propertyId: String, complete: @escaping @Sendable (PropertyResponseData) -> ()) -> Request {
        return CtrlHubSession.api.request(PropertyRoutes.one(propertyId))
            .validate()
            .response(responseSerializer: PropertySerializer()) { response in
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
