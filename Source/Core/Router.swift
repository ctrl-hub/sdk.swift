// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation

/**
 Router is a protocol for routing calls to the correct path, usign the right method, on the API
 */
protocol Route {
    var path: String { get }
    var method: String { get }
    var domain: String { get }
    var useSessionToken: Bool { get }
}

@available(iOS 16.0, macOS 13.0, *)
extension Route {

    /// For our routers, expose a method to translate the route to
    /// a URLRequest that can be sent to the server
    func asURLRequest(parameters: [String: String]) -> URLRequest {
        let queryItems = parameters.map({ (key, value) -> URLQueryItem in
            URLQueryItem(name: key, value: String(value))
        })
        let base = URL(string: domain)!
        var request = URLRequest(url: base.appendingPathComponent(path).appending(queryItems: queryItems))
        request.httpMethod = method
        if useSessionToken {
            request.setValue(accessToken, forHTTPHeaderField: "X-Session-Token")
        }
        return request
    }
    
    /// Request makes the request to the backend
    func Request() async throws -> (Data, URLResponse) {
        let request = asURLRequest(parameters: [:])
        return try await URLSession.shared.data(for: request)
    }

    func Request(parameters: [String: String]) async throws -> (Data, URLResponse) {
        let request = asURLRequest(parameters: parameters)
        return try await URLSession.shared.data(for: request)
    }

    func Request(body: Encodable) async throws -> (Data, URLResponse) {
        var request = asURLRequest(parameters: [:])
        request.httpBody = try JSONEncoder().encode(body)
        return try await URLSession.shared.data(for: request)
    }

    func Request(parameters: [String: String], body: Encodable) async throws -> (Data, URLResponse) {
        var request = asURLRequest(parameters: parameters)
        request.httpBody = try JSONEncoder().encode(body)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return try await URLSession.shared.data(for: request)
    }
}
