// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Router

enum StreetRouter: Route {
    case All
    case One(String)

    var path: String {
        switch self {
        case .All:
            return "v3/governance/streets"
        case .One(let streetId):
            return "v3/governance/streets/\(streetId)"
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
public actor Streets {

    @MainActor public static let shared = Streets()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get(parameters: [String: String] = [:]) async throws -> [Street] {
        let (data, response) = try await StreetRouter.All.Request(parameters: parameters)
        return try decoder.decode([Street].self, from: data)
    }
    
    public func Get(streetId: String, parameters: [String: String] = [:]) async throws -> Street? {
        let (data, response) = try await StreetRouter.One(streetId.lowercased()).Request(parameters: parameters)
        return try decoder.decode(Street.self, from: data)
    }
}
