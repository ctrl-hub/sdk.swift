// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Router

enum EquipmentRouter: Route {
    case All(String)
    case One(String, String)

    var path: String {
        switch self {
        case .All(let orgId):
            return "/v3/orgs/\(orgId)/assets/equipment"
        case .One(let orgId, let equipmentId):
            return "/v3/orgs/\(orgId)/assets/equipment/\(equipmentId)"
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

public actor EquipmentItems {

    @MainActor public static let shared = EquipmentItems()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get(orgId: String) async throws -> [EquipmentItem] {
        let (data, response) = try await EquipmentRouter.All(orgId.lowercased()).Request()
        return try decoder.decode([EquipmentItem].self, from: data)
    }

    public func Get(orgId: String, equipmentId: String) async throws -> EquipmentItem? {
        let (data, response) = try await EquipmentRouter.One(orgId.lowercased(), equipmentId.lowercased()).Request()
        return try decoder.decode(EquipmentItem.self, from: data)
    }
}
