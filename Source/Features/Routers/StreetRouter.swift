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
            return "/v3/governance/streets"
        case .One(let streetId):
            return "/v3/governance/streets/\(streetId)"
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

@available(iOS 16.0, *)
public actor Streets {

    @MainActor public static let shared = Streets()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get() async throws -> [Street] {
        let (data, response) = try await StreetRouter.All.Request()
        return try decoder.decode([Street].self, from: data)
    }
    
    public func Get(streetId: String) async throws -> Street? {
        let (data, response) = try await StreetRouter.One(streetId.lowercased()).Request()
        return try decoder.decode(Street.self, from: data)
    }
}
