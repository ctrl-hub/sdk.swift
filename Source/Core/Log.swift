// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

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
            NSLog("[CtrlHub] [DEBUG] \(msg)")
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
            NSLog("[CtrlHub] [INFO] \(msg)")
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
            NSLog("[CtrlHub] [ERROR] \(msg)")
        }
    }

}
