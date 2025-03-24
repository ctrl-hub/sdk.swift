// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Router

enum VehiclesInspectionsRouter: Route {
    case All(String, String)
    case Create(String, String)

    var path: String {
        switch self {
        case .All(let orgId, let vehicleId):
            let url = "v3/orgs/\(orgId)/assets/vehicles/\(vehicleId)/inspections"
            return url
        case .Create(let orgId, let vehicleId):
            let url = "v3/orgs/\(orgId)/assets/vehicles/\(vehicleId)/inspections"
            return url
        }
    }
    
    var method: String {
        switch self {
        case .All:
            return "GET"
        case .Create:
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
public actor VehicleInspections {

    @MainActor public static let shared = VehicleInspections()
    private init() {}
    private let encoder = JSONAPIEncoder()
    private let decoder = JSONAPIDecoder()

    public func Get(orgId: String, vehicleId: String, parameters: [String: String] = [:]) async throws -> [VehicleInspection] {
        let (data, response) = try await VehiclesInspectionsRouter.All(orgId, vehicleId).Request(parameters: parameters)
        return try decoder.decode([VehicleInspection].self, from: data)
    }
    
    public func Create(orgId: String, vehicleId: String, inspection: VehicleInspection) async throws -> VehicleInspection {
        let body = try encoder.encode(VehicleInspection.createBody(
            id: inspection.id,
            inspectedAt: inspection.inspectedAt,
            checks: inspection.checks,
            comments: inspection.comments
        ))

        let (data, response) = try await VehiclesInspectionsRouter.Create(
            orgId.lowercased(),
            vehicleId.lowercased()
        ).Request(body: body)

        return try decoder.decode(VehicleInspection.self, from: data)
    }
}
