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

    var contentType: String {
        return "application/vnd.api+json"
    }

    var domain: String {
        Config.currentConfig!.apiDomain
    }

    var useSessionToken: Bool {
        true
    }
}

// MARK: - Interface

@available(iOS 16.0, macOS 13.0, *)
public actor Organisations {

    @MainActor public static let shared = Organisations()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get(parameters: [String: String] = [:]) async throws -> [Organisation] {
        let (data, response) = try await OrganisationRouter.All.Request(parameters: parameters)
        return try decoder.decode([Organisation].self, from: data)
    }

    public func Get(id: String, parameters: [String: String] = [:]) async throws -> Organisation? {
        let (data, response) = try await OrganisationRouter.One(id.lowercased()).Request(parameters: parameters)
        return try decoder.decode(Organisation.self, from: data)
    }
}
