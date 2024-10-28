//
//  ServiceAccount.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import JSONAPI

// MARK: - Reponse Data

public struct ServiceAccountAPIResponseData {
    public let serviceAccounts: [ServiceAccount]
}

public enum ServiceAccountAPIResponse {
    case Success(ServiceAccountAPIResponseData)
    case Fail(APIError)
}

// MARK: - Resources

/// A service account key is an OAuth2 Client ID / Client Secret
/// pair which can be used to authenticate against the API as
/// the service account which it belongs to
@ResourceWrapper(type: "service-account-keys")
public struct ServiceAccountKey: Sendable, Equatable {
    public var id: String

    /// Whether this key is enabled or not
    @ResourceAttribute() var enabled: Bool
}

/// A service account is a principal which can request resoources from the API
@ResourceWrapper(type: "service-accounts")
public struct ServiceAccount: Sendable, Equatable {
    public var id: String

    @ResourceAttribute() var name: String
    @ResourceAttribute() var description: String
    @ResourceAttribute() var email: String
    @ResourceAttribute() var enabled: Bool

    @ResourceRelationship var keys: [ServiceAccountKey]
}
