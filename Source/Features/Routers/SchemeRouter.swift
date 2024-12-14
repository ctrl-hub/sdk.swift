// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Router

enum SchemeRouter: Route {
    case All(String)
    case One(String, String)

    var path: String {
        switch self {
        case .All(let orgId):
            return "/v3/orgs/\(orgId)/governance/schemes"
        case .One(let orgId, let schemeId):
            return "/v3/orgs/\(orgId)/governance/schemes/\(schemeId)"
        }
    }
    
    var method: String {
        switch self {
        case .All:
            return "GET"
        case .One:
            return "GET"
        }
    }

    var domain: String {
        Config.currentConfig!.apiDomain
    }
}

// MARK: - Interface

@available(iOS 16.0, *)
public actor Schemes {

    @MainActor public static let shared = Schemes()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get(orgId: String) async throws -> [Scheme] {
        let (data, response) = try await SchemeRouter.All(orgId.lowercased()).Request()
        return try decoder.decode([Scheme].self, from: data)
    }

    public func Get(orgId: String, schemeId: String) async throws -> Scheme? {
        let (data, response) = try await SchemeRouter.One(orgId.lowercased(), schemeId.lowercased()).Request()
        return try decoder.decode(Scheme.self, from: data)
    }
}
