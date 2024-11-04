// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import Alamofire
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
}

// MARK: - Interface

public actor Schemes {

    @MainActor public static let shared = Schemes()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get(orgId: String) async throws -> [Scheme] {
        let (data, response) = try await SchemeRouter.All(orgId).Request()
        return try decoder.decode([Scheme].self, from: data)
    }

    public func Get(orgId: String, schemeId: String) async throws -> Scheme? {
        let (data, response) = try await SchemeRouter.One(orgId, schemeId).Request()
        return try decoder.decode(Scheme.self, from: data)
    }
}
