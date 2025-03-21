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

    @ResourceAttribute(key: "inspected_at") public var inspectedAt: Date

    @ResourceAttribute() public var checks: VehicleInspectionChecks

}

public struct VehicleInspectionChecks: Codable, Equatable, Sendable {

    public var access: Bool?
    public var alarm: Bool?
    public var beacons: Bool?

    public init(access: Bool?, alarm: Bool?, beacons: Bool?) {
        self.access = access
        self.alarm = alarm
        self.beacons = beacons
    }
}
