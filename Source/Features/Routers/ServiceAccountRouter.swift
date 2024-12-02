// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Router

enum ServiceAccountRouter: Route {
    case All(String)
    case One(String, String)
    case Logs(String, String)
    case Log(String, String, String)

    var path: String {
        switch self {
        case .All(let orgId):
            return "/v3/orgs/\(orgId)/iam/service-accounts"
        case .One(let orgId, let serviceAccountId):
            return "/v3/orgs/\(orgId)/iam/service-accounts/\(serviceAccountId)"
        case .Logs(let orgId, let serviceAccountId):
            return "/v3/orgs/\(orgId)/iam/service-accounts/\(serviceAccountId)/logs"
        case .Log(let orgId, let serviceAccountId, let logId):
            return "/v3/orgs/\(orgId)/iam/service-accounts/\(serviceAccountId)/logs/\(logId)"
        }
    }

    var method: String {
        switch self {
        case .All:
            return "GET"
        case .One:
            return "GET"
        case .Logs:
            return "GET"
        case .Log:
            return "GET"
        }
    }
}

// MARK: - Interface

public actor ServiceAccounts {

    @MainActor public static let shared = ServiceAccounts()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get(orgId: String) async throws -> [ServiceAccount] {
        let (data, response) = try await ServiceAccountRouter.All(orgId.lowercased()).Request()
        return try decoder.decode([ServiceAccount].self, from: data)
    }

    public func Get(orgId: String, serviceAccountId: String) async throws -> ServiceAccount? {
        let (data, response) = try await ServiceAccountRouter.One(orgId.lowercased(), serviceAccountId.lowercased()).Request()
        return try decoder.decode(ServiceAccount.self, from: data)
    }

    public func Logs(orgId: String, serviceAccountId: String) async throws -> [ServiceAccountLog]? {
        let (data, response) = try await ServiceAccountRouter.Logs(orgId.lowercased(), serviceAccountId.lowercased()).Request()
        return try decoder.decode([ServiceAccountLog].self, from: data)
    }

    public func Log(orgId: String, serviceAccountId: String, logId: String) async throws -> ServiceAccountLog? {
        let (data, response) = try await ServiceAccountRouter.Log(orgId.lowercased(), serviceAccountId.lowercased(), logId.lowercased()).Request()
        return try decoder.decode(ServiceAccountLog.self, from: data)
    }

}
