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
}

extension Route {

    /// For our routers, expose a method to translate the route to
    /// a URLRequest that can be sent to the server
    func asURLRequest() -> URLRequest {
        let base = URL(string: Config.currentConfig!.apiDomain)!
        var request = URLRequest(url: base.appendingPathComponent(path))
        request.httpMethod = method
        request.headers.add(name: "X-Session-Token", value: accessToken)
        return request
    }
    
    /// Request makes the request to the backend
    func Request() async throws -> (Data, URLResponse) {
        let request = asURLRequest()
        return try await URLSession.shared.data(for: request)
        // TODO: - Make this into a generic, like below:
    }

    //func request<T>(_ element: T.Type, request: URLRequest) async throws -> T? where T: Decodable {
    //    let decoder = JSONAPIDecoder()
    //    let (data, response) = try await URLSession.shared.data(for: request)
    //    return try decoder.decode(Organisation.self, from: data)
    //}

}
