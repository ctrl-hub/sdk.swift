//
//  ServiceAccount.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import JSONAPI

@ResourceWrapper(type: "service-account-keys")
public struct ServiceAccountKey: Sendable, Equatable {
    public var id: String

    @ResourceAttribute() var enabled: Bool
}

@ResourceWrapper(type: "service-accounts")
public struct ServiceAccount: Sendable, Equatable {
    public var id: String

    @ResourceAttribute() var name: String
    @ResourceAttribute() var description: String
    @ResourceAttribute() var email: String
    @ResourceAttribute() var enabled: Bool

    @ResourceRelationship var keys: [ServiceAccountKey]
}
