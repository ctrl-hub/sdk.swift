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
    @ResourceAttribute() public var start_date: String?

    /// The projected end date of the scheme
    @ResourceAttribute() public var end_date: String?

    /// Labels which are present
    @ResourceAttribute() public var labels: [Label]

    @ResourceRelationship public var work_orders: [WorkOrder]
}
