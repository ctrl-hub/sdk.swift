//
//  RoleModels.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import JSONAPI

// MARK: - Resources

/// An IAM role
@ResourceWrapper(type: "roles")
public struct Role: Sendable, Equatable, Identifiable {
    
    /// The role ID
    public var id: String
    
    /// The role name
    @ResourceAttribute() public var name: String
    
    /// The role description
    @ResourceAttribute() public var description: String
    
    /// Whether the role is a custom role (created by the customer)
    @ResourceAttribute() public var custom: Bool
    
    /// The role launch stage
    @ResourceAttribute(key: "launch_stage") public var launchStage: String
    
    /// The role permissions
    @ResourceAttribute() public var permissions: [String]
    
}
