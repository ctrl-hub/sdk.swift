// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Resources

@ResourceWrapper(type: "vehicles")
public struct Vehicle: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceAttribute() public var vin: String?

    @ResourceAttribute() public var registration: String?

    @ResourceAttribute() public var description: String?

    @ResourceRelationship() public var model: VechicleModel

    @ResourceRelationship() public var specification: VechicleSpecification
    
    @ResourceRelationship() public var equipment: [EquipmentItem]
}

@ResourceWrapper(type: "vehicle-manufacturers")
public struct VehicleManufacturer: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceAttribute() public var name: String
}

@ResourceWrapper(type: "vehicle-models")
public struct VechicleModel: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceRelationship() public var manufacturer: VehicleManufacturer

    @ResourceAttribute() public var name: String
}

@ResourceWrapper(type: "vehicle-specifications")
public struct VechicleSpecification: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceAttribute() public var emissions: Double

    @ResourceAttribute() public var transmission: String
}
