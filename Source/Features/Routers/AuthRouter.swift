//
//  Auth.swift
//  CtrlHub
//
//  Created by Andrew Waters on 04/11/2024.
//

import Foundation

enum AuthRouter: Route {
    case Initiate
    case Complete(String)
    
    var path: String {
        switch self {
        case .Initiate:
            return "self-service/login/api"
        case .Complete(let id):
            return "/self-service/login?flow=\(id)"
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

    public func Complete(id: String) async throws -> AuthFlow? {
        let (data, response) = try await AuthRouter.Initiate.Request()
        return try decoder.decode(AuthFlow.self, from: data)
    }
}

public struct AuthFlow: Decodable, Identifiable {
    public let id: String
    public let ui: AuthFlowUI
}

public struct AuthFlowUI: Decodable {
    public let action: String
    public let method: String
}


