// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Resources

/// A physical street which can be referenced uniquely
@ResourceWrapper(type: "streets")
public struct Street: Sendable, Equatable, Identifiable {
    
    /// The ID of the street
    public var id: String
    
    /// The USRN of the street (for UK addresses)
    @ResourceAttribute() public var usrn: Int64

    /// The location of the street
    // TODO: - this isn't working because the MLS might be [[null]] or [[]] or [[Double]]
//    @ResourceAttribute() public var location: MultiLineString
}
