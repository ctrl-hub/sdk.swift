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
            return "v3/orgs/\(orgId)/assets/vehicles"
        }
    }
    
    var method: String {
        switch self {
        case .All:
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
public actor Vehicles {

    @MainActor public static let shared = Vehicles()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get(orgId: String, parameters: [String: String] = [:]) async throws -> [Vehicle] {
        let (data, response) = try await VehiclesRouter.All(orgId.lowercased()).Request(parameters: parameters)
        return try decoder.decode([Vehicle].self, from: data)
    }
}
