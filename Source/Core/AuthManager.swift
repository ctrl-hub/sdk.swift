// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import Dispatch

/**
 Responsible for obtaining and persisting the access token which is granted in exchange for login credentials
 */
//open class AuthManager {
//    
//    public enum UserState: Int {
//        case loggedIn
//        case loggedOut
//    }
//
//    // MARK: - Properties
//
//    private func initiateLoginUrl() -> String? {
//        if let config = Config.currentConfig {
//            return "\(config.authDomain)self-service/login/api"
//        }
//        return nil
//    }
//    
//    private func loginUrl(flowId: String) -> String? {
//        if let config = Config.currentConfig {
//            return "\(config.authDomain)self-service/login?flow=\(flowId)"
//        }
//        return nil
//    }
//
//}
