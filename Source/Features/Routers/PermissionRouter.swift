// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Router

enum PermissionRouter: Route {
    case All
    case One(String)

    var path: String {
        switch self {
        case .All:
            return "/v3/admin/iam/permissions"
        case .One(let permissionId):
            return "/v3/admin/iam/permissions/\(permissionId)"
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

public actor Permissions {
    
    @MainActor public static let shared = Permissions()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get() async throws -> [Permission] {
        let (data, response) = try await PermissionRouter.All.Request()
        return try decoder.decode([Permission].self, from: data)
    }
    
    public func Get(id: String) async throws -> Permission? {
        let (data, response) = try await PermissionRouter.One(id.lowercased()).Request()
        return try decoder.decode(Permission.self, from: data)
    }
}
