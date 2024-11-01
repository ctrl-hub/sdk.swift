//
//  PermissionModels.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import JSONAPI

// MARK: - Resources

/// An IAM role
@ResourceWrapper(type: "permissions")
public struct Permission: Sendable, Equatable, Identifiable {
    
    /// The ID of the role
    public var id: String
    
    /// The role description
    @ResourceAttribute() public var description: String

}
