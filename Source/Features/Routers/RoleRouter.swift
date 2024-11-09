// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Router

enum RoleRouter: Route {
    case All
    case One(String)

    var path: String {
        switch self {
        case .All:
            return "/v3/admin/iam/roles"
        case .One(let RoleId):
            return "/v3/admin/iam/roles/\(RoleId)"
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

public actor Roles {

    @MainActor public static let shared = Roles()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get() async throws -> [Role] {
        let (data, response) = try await RoleRouter.All.Request()
        return try decoder.decode([Role].self, from: data)
    }

    public func Get(id: String) async throws -> Role? {
        let (data, response) = try await RoleRouter.One(id.lowercased()).Request()
        return try decoder.decode(Role.self, from: data)
    }
}
