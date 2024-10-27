//
//  ServiceAccount.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation


@ResourceWrapper(type: "service-accounts")
public struct ServiceAccount: Sendable, Equatable {
    var id: String
}
