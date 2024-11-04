// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Router

enum OrganisationRouter: Route {
    case All
    case One(String)

    var path: String {
        switch self {
        case .All:
            return "v3/orgs"
        case .One(let orgId):
            return "v3/orgs/\(orgId)"
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

public actor Organisations {

    @MainActor public static let shared = Organisations()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get() async throws -> [Organisation] {
        let (data, response) = try await OrganisationRouter.All.Request()
        return try decoder.decode([Organisation].self, from: data)
    }

    public func Get(id: String) async throws -> Organisation? {
        let (data, response) = try await OrganisationRouter.One(id).Request()
        return try decoder.decode(Organisation.self, from: data)
    }
}
