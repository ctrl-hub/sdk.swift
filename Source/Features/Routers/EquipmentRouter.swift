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
    case CreateExposure(String, String)

    var path: String {
        switch self {
        case .All(let orgId):
            return "v3/orgs/\(orgId)/assets/equipment"
        case .One(let orgId, let equipmentId):
            return "v3/orgs/\(orgId)/assets/equipment/\(equipmentId)"
        case .CreateExposure(let orgId, let equipmentId):
            return "v3/orgs/\(orgId)/assets/equipment/\(equipmentId)/exposures"
        }
    }

    var method: String {
        switch self {
        case .All:
            return "GET"
        case .One:
            return "GET"
        case .CreateExposure:
            return "POST"
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
public actor EquipmentItems {
    
    @MainActor public static let shared = EquipmentItems()
    private init() {}
    private let encoder = JSONAPIEncoder()
    private let decoder = JSONAPIDecoder()
    
    public func Get(orgId: String, parameters: [String: String] = [:]) async throws -> [EquipmentItem] {
        let (data, response) = try await EquipmentRouter.All(orgId.lowercased()).Request(parameters: parameters)
        return try decoder.decode([EquipmentItem].self, from: data)
    }
    
    public func Get(orgId: String, equipmentId: String, parameters: [String: String] = [:]) async throws -> EquipmentItem {
        let (data, response) = try await EquipmentRouter.One(orgId.lowercased(), equipmentId.lowercased()).Request(parameters: parameters)
        return try decoder.decode(EquipmentItem.self, from: data)
    }
    
    public func CreateExposure(orgId: String, equipmentId: String, exposure: EquipmentExposure, parameters: [String: String] = [:]) async throws -> EquipmentExposure {
        let body = try encoder.encode(exposure)
        let (data, response) = try await EquipmentRouter.CreateExposure(orgId.lowercased(), equipmentId.lowercased()).Request(parameters: parameters, body: body)
        return try decoder.decode(EquipmentExposure.self, from: data)
    }
}
