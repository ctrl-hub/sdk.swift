//
//  PropertyModels.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import JSONAPI

// MARK: - Resources

/// A physical property which can be referenced uniquely
@ResourceWrapper(type: "properties")
public struct Property: Sendable, Equatable {
    
    /// The ID of the property
    public var id: String
    
    /// The UPRN of the property (for UK addresses)
    @ResourceAttribute() public var uprn: Int64
    
    /// The MPRN of the property (gas meters)
    @ResourceAttribute() public var mprn: Int64
    
    /// The MPAN at the property (electricity meters)
    @ResourceAttribute() public var mpan: Int64
    
    /// PSR (Priority Services Register) information about the property occupants
    @ResourceAttribute() public var psr: PSR
    
    /// The long / lat location of the property
    @ResourceAttribute() public var location: PointLocation
}

/// PSR (Priority Services Register) attributes for the property
public struct PSR: Codable, Equatable, Sendable {

    /// Whether the property has a PSR indicator - `true` if the property has an occupant on the PSR, otherwise `false`
    public var indicator: Bool

    /// Contact information for the customer
    public var contact: String

    /// The priority of the occupant
    public var priority: Int

    /// Notes about the occupant, which might include the needs of the vulnerable customer, or alternative contact information
    public var notes: String
}
