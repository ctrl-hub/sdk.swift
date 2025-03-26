// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Router

enum EquipmentExposuresRouter: Route {
    case Create(String, String)

    var path: String {
        switch self {
        case .Create(let orgId, let equipmentId):
            return "v3/orgs/\(orgId)/assets/equipment/\(equipmentId)/exposures"
        }
    }

    var method: String {
        switch self {
        case .Create:
            return "POST"
        }
    }

    var contentType: String {
        return "application/vnd.api+json"
    }

    var domain: String {
        Config.currentConfig!.apiDomain
    }

    var useSessionToken: Bool {
        true
    }
}

// MARK: - Interface

@available(iOS 16.0, macOS 13.0, *)
public actor EquipmentExposures {
    
    @MainActor public static let shared = EquipmentExposures()
    private init() {}
    private let encoder = JSONAPIEncoder()
    private let decoder = JSONAPIDecoder()
      
    public func Create(orgId: String, equipmentId: String, exposure: EquipmentExposure) async throws -> EquipmentExposure {
        let body = try encoder.encode(EquipmentExposure.createBody(
            id: exposure.id,
            startTime: exposure.startTime,
            endTime: exposure.endTime,
            ppe: PPE(
                mask: exposure.ppe.mask,
                earDefenders: exposure.ppe.earDefenders
            )
        ))
        
        let (data, response) = try await EquipmentExposuresRouter.Create(
            orgId.lowercased(),
            equipmentId.lowercased()
        ).Request(body: body)
        debugPrint(response)
        
        return try decoder.decode(EquipmentExposure.self, from: data)
   }
}
