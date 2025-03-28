// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI
import MapKit

// MARK: - Resources

/// A physical property which can be referenced uniquely
@ResourceWrapper(type: "properties")
public struct Property: Sendable, Equatable, Identifiable {
    
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

    public func coords() -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: self.location.coordinates[1],
            longitude: self.location.coordinates[0]
        )
    }
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
