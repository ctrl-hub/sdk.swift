// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import Alamofire
import JSONAPI

// MARK: - Router

enum PropertyRouter: Route {
    case All
    case One(String)

    var path: String {
        switch self {
        case .All:
            return "/v3/governance/properties"
        case .One(let propertyId):
            return "/v3/governance/properties/\(propertyId)"
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

public actor Properties {

    @MainActor public static let shared = Properties()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func Get() async throws -> [Property] {
        let (data, response) = try await PropertyRouter.All.Request()
        return try decoder.decode([Property].self, from: data)
    }
    
    public func Get(id: String) async throws -> Property? {
        let (data, response) = try await PropertyRouter.One(id).Request()
        return try decoder.decode(Property.self, from: data)
    }
}
