//
//  SchemeModels.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import JSONAPI

// MARK: - Resources

/// A scheme of work
@ResourceWrapper(type: "schemes")
public struct Scheme: Sendable, Equatable, Identifiable {
    
    /// The scheme ID
    public var id: String
    
    /// The name of the scheme
    @ResourceAttribute() public var name: String
    
    /// A code designated to the scheme
    @ResourceAttribute() public var code: String?
    
    /// A description of the scheme
    @ResourceAttribute() public var description: String?
    
    /// The scheme status
    @ResourceAttribute() public var status: String?

    /// The projected start date of the scheme
    @ResourceAttribute(key: "start_date") public var startDate: String?

    /// The projected end date of the scheme
    @ResourceAttribute(key: "end_date") public var endDate: String?

    /// Labels which are present
    @ResourceAttribute() public var labels: [Label]

    @ResourceRelationship(key: "work_orders") public var workOrders: [WorkOrder]
}
