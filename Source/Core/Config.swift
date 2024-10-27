//
//  Config.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation


/**
 Provides common configuration to use the package
 */
public class Config {

    // MARK: - Properties

    /// The current SDK configuration
    nonisolated(unsafe) static var currentConfig: Config? {
        didSet {
            // we might want to perform some operations when the configuration changes,
            // for example logging a user out
        }
    }

    /// Enable and disable logs entirely
    public private(set) var logsEnabled: Bool = true

    /// The log level for the package (defaults to debug)
    public private(set) var logLevel: LogLevel = .debug

    /// The domain to use for authentication requests
    public private(set) var authDomain: String = "https://auth.ctrl-hub.com"

    /// The domain to use for API requests
    public private(set) var apiDomain: String = "https://api.ctrl-hub.com"

    // MARK: - Lifecycle
    
    public convenience init?(logsEnabled: Bool, logLevel: LogLevel = .debug) {
        guard let path = Bundle.main.path(forResource: "CtrlHubAPIConfig", ofType: "plist"),
              let config = NSDictionary(contentsOfFile: path) else {
            return nil
        }
        self.init(config: config, logsEnabled: logsEnabled, logLevel: logLevel)
    }
    
    public init?(config: NSDictionary, logsEnabled: Bool, logLevel: LogLevel = .debug) {
        self.logsEnabled = logsEnabled
        self.logLevel = logLevel

        self.authDomain = (config["authDomain"] as? String)!
        self.apiDomain = (config["apiDomain"] as? String)!
        
        if !self.authDomain.hasSuffix("/") {
            self.authDomain.append("/")
        }

        if !self.apiDomain.hasSuffix("/") {
            self.apiDomain.append("/")
        }

        if !validate() {
            return nil
        }
    }

    // MARK: - Utilities

    /**
        Validates the current configuration and logs errors where the configuration is not valid

        - returns: `true` if the current configuration is valid, `false` if not
     */
    public func validate() -> Bool {
        var valid: Bool = true

        if (authDomain).isEmpty {
            valid = false
            Log.error("No authDomain specified")
        }

        if (apiDomain).isEmpty {
            valid = false
            Log.error("No apiDomain specified")
        }

        return valid
    }
}
