//
//  Auth.swift
//  CtrlHub
//
//  Created by Andrew Waters on 04/11/2024.
//

import Foundation

enum AuthRouter: Route {
    case Initiate
    case Complete
    
    var path: String {
        switch self {
        case .Initiate:
            return "self-service/login/api"
        case .Complete:
            return "self-service/login"
        }
    }

    var method: String {
        switch self {
        case .Initiate:
            return "GET"
        case .Complete:
            return "POST"
        }
    }

    var domain: String {
        Config.currentConfig!.authDomain
    }

    var useSessionToken: Bool {
        false
    }
}

@available(iOS 16.0, *)
public actor Auth {

    @MainActor public static let shared = Auth()
    private init() {}
    private let decoder = JSONDecoder()

    public func Initiate() async throws -> AuthFlow? {
        let (data, response) = try await AuthRouter.Initiate.Request()
        return try decoder.decode(AuthFlow.self, from: data)
    }

    public func Complete(flow: AuthFlow, email: String, password: String) async throws -> AuthResponse? {
        let body = LoginPayload(identifier: email, password: password, method: "password")
        let (data, response) = try await AuthRouter.Complete.Request(parameters: ["flow": flow.id], body: body)
        return try decoder.decode(AuthResponse.self, from: data)
    }
}

public struct LoginPayload: Encodable {
    let identifier: String
    let password: String
    let method: String
}

public struct AuthFlow: Sendable, Decodable, Identifiable {
    public let id: String
}

public struct AuthResponse: Sendable, Decodable {
    public let sessionToken: String
    
    enum CodingKeys: String, CodingKey {
        case sessionToken = "session_token"
    }
}
