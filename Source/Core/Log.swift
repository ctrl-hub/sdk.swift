//
//  Log.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation

public enum LogLevel: Int {
    case debug
    case info
    case error
}

class Log {

    /**
        Debug adds a debug message to the NSLog if logs are enabled and debug level is set
     */
    class func debug(_ message: @autoclosure () -> String?) {
        guard let msg = message() else {
            return
        }

        let config = Config.currentConfig

        if config == nil || (config!.logsEnabled && config!.logLevel == .debug) {
            NSLog("[CTRLHUBAPI] [DEBUG] \(msg)")
        }
    }

    /**
        Info adds an info message to the NSLog if logs are enabled and debug or info level is set
     */
    class func info(_ message: @autoclosure () -> String?) {
        guard let msg = message() else {
            return
        }

        let config = Config.currentConfig

        if config == nil || (config!.logsEnabled && (config!.logLevel == .debug || config!.logLevel == .info)) {
            NSLog("[CTRLHUBAPI] [INFO] \(msg)")
        }
    }

    /**
        Error adds an error message to the NSLog if logs are enabled
     */
    class func error(_ message: @autoclosure () -> String?) {
        guard let msg = message() else {
            return
        }

        let config = Config.currentConfig

        if config == nil || config!.logsEnabled {
            NSLog("[CTRLHUBAPI] [ERROR] \(msg)")
        }
    }

}
