// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

public var config: Config? {
    get {
        return Config.currentConfig
    }
    set(newConfig) {
        Config.currentConfig = newConfig
    }
}

