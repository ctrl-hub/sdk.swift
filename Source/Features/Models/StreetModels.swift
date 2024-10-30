//
//  StreetModels.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import JSONAPI

// MARK: - Resources

/// A physical street which can be referenced uniquely
@ResourceWrapper(type: "streets")
public struct Street: Sendable, Equatable {
    
    /// The ID of the street
    public var id: String
    
    /// The USRN of the street (for UK addresses)
    @ResourceAttribute() public var usrn: Int64

    /// The location of the street
    // TODO: - this isn't working because the MLS might be [[null]] or [[]] or [[Double]]
//    @ResourceAttribute() public var location: MultiLineString
}
