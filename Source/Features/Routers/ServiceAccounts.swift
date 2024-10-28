//
//  ServiceAccounts.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import Alamofire

enum ServiceAccountRoutes {
    case all(String)
    case one(String, String)
    case logs(String, String)
    case keys(String, String)

    var baseURL: URL {
        return URL(string: "https://api.ctrl-hub.dev")!
    }
    
    var path: String {
        switch self {
        case .all(let org):
            return "/v3/orgs/\(org)/admin/iam/service-accounts"
        case .one(let org, let id):
            return "/v3/orgs/\(org)/admin/iam/service-accounts/\(id)"
        case .logs(let org, let id):
            return "/v3/orgs/\(org)/admin/iam/service-accounts/\(id)/logs"
        case .keys(let org, let id):
            return "/v3/orgs/\(org)/admin/iam/service-accounts/\(id)/keys"
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
        case .keys:
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

@available(iOS 13.0.0, *)
public class ServiceAccounts {
    
    static public func get(org: String) async throws -> [ServiceAccount] {
        do {
            APISession.default.request(ServiceAccountRoutes.all(org)).response { response in
                debugPrint(response)
            }
        } catch {
            throw error
        }
//        Log.info(route.baseURL.absoluteString + route.path)
        return [ServiceAccount(id: "")]
    }
    
    static public func get(org: String, id: String) async throws -> ServiceAccount {
        let route = ServiceAccountRoutes.one(org, id)
        Log.info(route.baseURL.absoluteString + route.path)
        return ServiceAccount(id: "")
    }
    
    static public func logs(org: String, id: String) {
        let route = ServiceAccountRoutes.logs(org, id)
        Log.info(route.baseURL.absoluteString + route.path)
    }
    
    static public func keys(org: String, id: String) {
        let route = ServiceAccountRoutes.keys(org, id)
        Log.info(route.baseURL.absoluteString + route.path)
    }

}
