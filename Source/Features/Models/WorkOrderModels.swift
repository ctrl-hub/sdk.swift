//
//  WorkOrderModels.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 31/10/2024.
//

import Foundation
import JSONAPI

// MARK: - Resources

@ResourceWrapper(type: "work-orders")
public struct WorkOrder: Sendable, Equatable {
    public var id: String

    @ResourceAttribute() public var name: String?

    @ResourceAttribute() public var code: String?

    @ResourceAttribute() public var description: String?

    @ResourceAttribute() public var usrns: [Int64]

    @ResourceAttribute() public var uprns: [Int64]

    @ResourceAttribute() public var start_date: String?

    @ResourceAttribute() public var end_date: String?

    @ResourceAttribute() public var labels: [Label]

    @ResourceRelationship public var operations: [Operation]
}
