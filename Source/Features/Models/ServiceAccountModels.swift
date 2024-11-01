// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Resources

/// A service account is a principal which can request resources from the API
@ResourceWrapper(type: "service-accounts")
public struct ServiceAccount: Sendable, Equatable {

    /// The ID of the service account
    public var id: String

    /// The name of the service account
    @ResourceAttribute() public var name: String

    /// A description of the service account
    @ResourceAttribute() public var description: String

    /// A unique email for the service account
    @ResourceAttribute() public var email: String

    /// Whether the service account is enabled or not
    @ResourceAttribute() public var enabled: Bool

    /// Keys that the service account can use to access the API
    @ResourceRelationship public var keys: [ServiceAccountKey]
}

/// A service account key is an OAuth2 Client ID / Client Secret
/// pair which can be used to authenticate against the API as
/// the service account which it belongs to
@ResourceWrapper(type: "service-account-keys")
public struct ServiceAccountKey: Sendable, Equatable {

    /// The ID of the Key
    public var id: String

    /// Whether this key is enabled or not
    @ResourceAttribute() public var enabled: Bool
}

/**
 A request log is a record of a request and response sent to the API.
 
 It contains the original request, the response and some additional data about the request.
 */
@ResourceWrapper(type: "logs")
public struct RequestLog: Sendable, Equatable {

    /// The ID of the Log
    public var id: String

    /// The duration of time (in ms) that the request took to process
    @ResourceAttribute() public var duration: Int

    /// The actor who made the request
    @ResourceAttribute() public var actor: Actor

    /// The request that was received and processed by the API
    @ResourceAttribute() public var request: RequestLogRequest

    /// The response that was sent to the caller
    @ResourceAttribute() public var response: RequestLogResponse
}

/**
 The actor who made the request
 */
public struct Actor: Codable, Equatable, Sendable, Identifiable {

    /// The Principals ID
    public var id: String

    /// The type of Principal (e.g. "service-accounts" | "users")
    public var type: String
}

/**
 The request that was received and processed by the API
 */
public struct RequestLogRequest: Codable, Equatable, Sendable {

    /// The content length of the request (in bytes)
    public var content_length: Int

    /// The request method
    public var method: String

    /// The path the request was made to (if you need the host, this is usually in the `X-Forwarded-Host` header)
    public var path: String

    /// The query params that were sent woth the request
    public var query: [String: [String]]

    /// A string ltieral of the query params
    public var raw_query: String

    /// The time the request was received by the API
    public var time: String

    /// A string representation of the body
    public var body: String

    /// The headers that were sent with the request (and others appended by the API ingress)
    public var headers: [String: [String]]
}

/**
 The response that was sent to the caller
*/
public struct RequestLogResponse: Codable, Equatable, Sendable {

    /// The time the response was sent
    public var time: String

    /// The status code sent
    public var status: Int

    /// A string representation of the body included in the response
    public var body: String

    /// The headers that were returned to the caller
    public var headers: [String: [String]]
}
