// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Resources

/// A service account is a principal which can request resources from the API
@ResourceWrapper(type: "organisations")
public struct Organisation: Sendable, Equatable, Identifiable {

    /// The ID of the organisation
    public var id: String

    /// The name of the organisation
    @ResourceAttribute() public var name: String

    /// A description for the organisation
    @ResourceAttribute() public var description: String

    /// A unique slug for the organisation
    @ResourceAttribute() public var slug: String
}
