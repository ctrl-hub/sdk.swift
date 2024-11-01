// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Resources

/// An IAM role
@ResourceWrapper(type: "permissions")
public struct Permission: Sendable, Equatable, Identifiable {

    /// The ID of the role
    public var id: String

    /// The role description
    @ResourceAttribute() public var description: String

}
