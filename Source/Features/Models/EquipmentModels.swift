// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Resources

@ResourceWrapper(type: "equipment-items")
public struct EquipmentItem: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceAttribute() public var serial: String

    @ResourceRelationship public var model: EquipmentModel

    @ResourceRelationship public var manufacturer: EquipmentManufacturer
}

@ResourceWrapper(type: "equipment-models")
public struct EquipmentModel: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceAttribute() public var description: String

    @ResourceAttribute() public var name: String

    @ResourceAttribute() public var vibration: EquipmentModelVibration

//    @ResourceRelationship public var manufacturer: EquipmentManufacturer?
}

public struct EquipmentModelVibration: Codable, Equatable, Sendable {
    
    public var magnitude: Float64
    
}

@ResourceWrapper(type: "equipment-manufacturers")
public struct EquipmentManufacturer: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceAttribute() public var name: String
}
