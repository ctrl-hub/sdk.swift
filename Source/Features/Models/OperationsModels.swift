//
//  OperationsModels.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 31/10/2024.
//

import Foundation
import JSONAPI

// MARK: - Resources

@ResourceWrapper(type: "operations")
public struct Operation: Sendable, Equatable {
    public var id: String

    @ResourceAttribute() public var code: String?

    @ResourceAttribute() public var description: String?

    @ResourceAttribute() public var start_date: String?
    
    @ResourceAttribute() public var end_date: String?

    @ResourceAttribute() public var aborted: Bool

    @ResourceAttribute() public var cancelled: Bool

    @ResourceAttribute() public var labels: [Label]

    @ResourceAttribute() public var completed: Bool
}
