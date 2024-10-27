//
//  ServiceAccounts.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import Alamofire

enum ServiceAccountRoutes {
    case all
    case one(String)
    case logs(String)
    case keys(String)

    var baseURL: URL {
        return URL(string: "https://api.ctrl-hub.dev")!
    }
    
    var path: String {
        switch self {
        case .all:
            return "/v3/admin/iam/service-accounts"
        case .one(let id):
            return "/v3/admin/iam/service-accounts/\(id)"
        case .logs(let id):
            return "/v3/admin/iam/service-accounts/\(id)/logs"
        case .keys(let id):
            return "/v3/admin/iam/service-accounts/\(id)/keys"
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
    
    static public func get() async throws -> [ServiceAccount] {
        do {
            let sa = AF.request(ServiceAccountRoutes.all)
        } catch {
            throw error
        }
//        Log.info(route.baseURL.absoluteString + route.path)
        return [ServiceAccount(id: "")]
    }
    
    static public func get(id: String) async throws -> ServiceAccount {
        let route = ServiceAccountRoutes.one(id)
        Log.info(route.baseURL.absoluteString + route.path)
        return ServiceAccount(id: "")
    }
    
    static public func logs(id: String) {
        let route = ServiceAccountRoutes.logs(id)
        Log.info(route.baseURL.absoluteString + route.path)
    }
    
    static public func keys(id: String) {
        let route = ServiceAccountRoutes.keys(id)
        Log.info(route.baseURL.absoluteString + route.path)
    }

}
