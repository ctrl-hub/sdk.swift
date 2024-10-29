//
//  OrganisationModels.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import JSONAPI

// MARK: - Resources

/// A service account is a principal which can request resources from the API
@ResourceWrapper(type: "organisations")
public struct Organisation: Sendable, Equatable {

    /// The ID of the organisation
    public var id: String

    /// The name of the organisation
    @ResourceAttribute() public var name: String

    /// A description for the organisation
    @ResourceAttribute() public var description: String

    /// A unique slug for the organisation
    @ResourceAttribute() public var slug: String
}
