// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Router

enum IAMRouter: Route {
    case WhoAmI

    var path: String {
        switch self {
        case .WhoAmI:
            return "v3/iam/whoami"
        }
    }

    var method: String {
        switch self {
        case .WhoAmI:
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
public actor IAM {

    @MainActor public static let shared = IAM()
    private init() {}
    private let decoder = JSONAPIDecoder()

    public func WhoAmI() async throws -> User {
        let (data, response) = try await IAMRouter.WhoAmI.Request()
        return try decoder.decode(User.self, from: data)
    }
}
