// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Resources

@ResourceWrapper(type: "vehicle-inspections")
public struct VehicleInspection: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceAttribute(key: "inspected_at") public var inspectedAt: String

    @ResourceAttribute() public var checks: VehicleInspectionChecks
    
    public init(id: String, inspectedAt: String, checks: VehicleInspectionChecks) {
        self.id = id
        self.inspectedAt = inspectedAt
        self.checks = checks
    }
}

public struct VehicleInspectionChecks: Codable, Equatable, Sendable {

    public var access: Bool?
    public var alarm: Bool?
    public var beacons: Bool?
    public var dailyChecks: Bool?
    public var damage: Bool?
    public var levels: Bool?
    public var lights: Bool?
    public var liquids: Bool?
    public var rearPlate: Bool?
    public var security: Bool?
    public var serviced: Bool?
    public var sparePlate: Bool?
    public var storage: Bool?
    public var tidiness: Bool?
    public var towing: Bool?
    public var tyres: Bool?
    public var warningLights: Bool?
    public var washers: Bool?
    public var windscreen: Bool?

    public init(
        access: Bool?,
        alarm: Bool?,
        beacons: Bool?,
        dailyChecks: Bool?,
        damage: Bool?,
        levels: Bool?,
        lights: Bool?,
        liquids: Bool?,
        rearPlate: Bool?,
        security: Bool?,
        serviced: Bool?,
        sparePlate: Bool?,
        storage: Bool?,
        tidiness: Bool?,
        towing: Bool?,
        tyres: Bool?,
        warningLights: Bool?,
        washers: Bool?,
        windscreen: Bool?
    ) {
        self.access = access
        self.alarm = alarm
        self.beacons = beacons
        self.dailyChecks = dailyChecks
        self.damage = damage
        self.levels = levels
        self.lights = lights
        self.liquids = liquids
        self.rearPlate = rearPlate
        self.security = security
        self.serviced = serviced
        self.sparePlate = sparePlate
        self.storage = storage
        self.tidiness = tidiness
        self.towing = towing
        self.tyres = tyres
        self.warningLights = warningLights
        self.washers = washers
        self.windscreen = windscreen
    }

    enum CodingKeys: String, CodingKey {
        case access = "safe_access"
        case alarm = "reversing_alarm"
        case beacons = "beacons"
        case dailyChecks = "driver_checks"
        case damage = "visible_damage"
        case levels = "levels"
        case lights = "lights_and_indicators"
        case liquids = "chemicals_and_fuel"
        case rearPlate = "number_plate"
        case security = "security"
        case serviced = "servicing"
        case sparePlate = "spare_number_plate"
        case storage = "storage"
        case tidiness = "cleanliness"
        case towing = "accessories"
        case tyres = "tyres"
        case warningLights = "engine_warning_lights"
        case washers = "washers_and_wipers"
        case windscreen = "windscreen"
    }
}
