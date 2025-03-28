// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Router

enum PropertyRouter: Route {
    case All
    case One(String)

    var path: String {
        switch self {
        case .All:
            return "v3/governance/properties"
        case .One(let propertyId):
            return "v3/governance/properties/\(propertyId)"
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
public actor Properties {

    @MainActor public static let shared = Properties()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get(parameters: [String: String] = [:]) async throws -> [Property] {
        let (data, response) = try await PropertyRouter.All.Request(parameters: parameters)
        return try decoder.decode([Property].self, from: data)
    }
    
    public func Get(id: String, parameters: [String: String] = [:]) async throws -> Property? {
        let (data, response) = try await PropertyRouter.One(id.lowercased()).Request(parameters: parameters)
        return try decoder.decode(Property.self, from: data)
    }
}
