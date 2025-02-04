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

    @ResourceAttribute() public var colour: String?

    @ResourceAttribute() public var status: String?

    @ResourceRelationship() public var specification: VehicleSpecification

    @ResourceRelationship() public var equipment: [VehicleEquipmentItem]
}

@ResourceWrapper(type: "equipment-items")
public struct VehicleEquipmentItem: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceAttribute() public var serial: String
}

@ResourceWrapper(type: "vehicle-manufacturers")
public struct VehicleManufacturer: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceAttribute() public var name: String
}

@ResourceWrapper(type: "vehicle-models")
public struct VehicleModel: Sendable, Equatable, Identifiable {
    public var id: String
    
    @ResourceAttribute() public var name: String
    
    @ResourceRelationship() public var manufacturer: VehicleManufacturer
}

public struct VehicleDocumentation: Codable, Equatable, Sendable {

    public var name: String

    public var description: String

    public var link: String
}

@ResourceWrapper(type: "vehicle-specifications")
public struct VehicleSpecification: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceAttribute() public var emissions: Double

    @ResourceAttribute() public var year: Int

    @ResourceAttribute(key: "fuel_type") public var fuel: String

    @ResourceAttribute(key: "engine_capacity") public var engine: Int

    @ResourceAttribute() public var documentation: [VehicleDocumentation]
    
    @ResourceRelationship() public var model: VehicleModel
}
