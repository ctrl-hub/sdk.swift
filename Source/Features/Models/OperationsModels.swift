//
//  OperationsModels.swift
//  CtrlHub
//
//  Created by Andrew Waters on 31/10/2024.
//

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
