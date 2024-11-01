// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Resources

@ResourceWrapper(type: "operations")
public struct Operation: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceAttribute() public var code: String?

    @ResourceAttribute() public var description: String?

    @ResourceAttribute(key: "start_date") public var startDate: String?
    
    @ResourceAttribute(key: "end_date") public var endDate: String?

    @ResourceAttribute() public var aborted: Bool

    @ResourceAttribute() public var cancelled: Bool

    @ResourceAttribute() public var labels: [Label]

    @ResourceAttribute() public var completed: Bool
}
