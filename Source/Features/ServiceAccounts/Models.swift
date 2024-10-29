//
//  ServiceAccount.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import JSONAPI

// MARK: - Reponse Data

public enum ServiceAccountOneResponse {
    case Success(ServiceAccount)
    case Fail(RequestError)
}

public enum ServiceAccountManyResponse {
    case Success([ServiceAccount])
    case Fail(RequestError)
}

public enum RequestLogsOneResponse {
    case Success(RequestLog)
    case Fail(RequestError)
}

public enum RequestLogsManyResponse {
    case Success([RequestLog])
    case Fail(RequestError)
}

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

/// A request log is a record of a request and response sent to the
/// API. It contains the original request, the response and some
/// additional data about the request
@ResourceWrapper(type: "logs")
public struct RequestLog: Sendable, Equatable {

    /// The ID of the Log
    public var id: String

    /// The duration of time (in ms) that the request took to process
    @ResourceAttribute() public var duration: Int

    public struct actor {
        @ResourceAttribute() public var id: String
        @ResourceAttribute() public var type: String
    }
}
