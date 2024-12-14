// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Router

enum VehiclesRouter: Route {
    case All(String)

    var path: String {
        switch self {
        case .All(let orgId):
            return "/v3/orgs/\(orgId)/assets/vehicles"
        }
    }
    
    var method: String {
        switch self {
        case .All:
            return "GET"
        }
    }

    var domain: String {
        Config.currentConfig!.apiDomain
    }
}

// MARK: - Interface

@available(iOS 16.0, *)
public actor Vehicles {

    @MainActor public static let shared = Vehicles()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get(orgId: String) async throws -> [Vehicle] {
        let (data, response) = try await VehiclesRouter.All(orgId.lowercased()).Request(parameters: [
            "include": "equipment,specification,specification.model,specification.model.manufacturer"
        ])
        return try decoder.decode([Vehicle].self, from: data)
    }
}
