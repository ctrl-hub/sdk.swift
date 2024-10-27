//
//  AuthManager.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation
import Dispatch

/**
 Responsible for obtaining and persisting the access token which is granted in exchange for login credentials
 */
open class AuthManager {
    
    public enum UserState: Int {
        case loggedIn
        case loggedOut
    }

    // MARK: - Properties

    private func initiateLoginUrl() -> String? {
        if let config = Config.currentConfig {
            return "\(config.authDomain)self-service/login/api"
        }
        return nil
    }
    
    private func loginUrl(flowId: String) -> String? {
        if let config = Config.currentConfig {
            return "\(config.authDomain)self-service/login?flow=\(flowId)"
        }
        return nil
    }

}
