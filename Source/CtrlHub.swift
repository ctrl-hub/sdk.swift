//
//  CtrlHub.swift
//  CtrlHub
//
//  Created by Andrew Waters on 27/10/2024.
//

public var config: Config? {
    get {
        return Config.currentConfig
    }
    set(newConfig) {
        Config.currentConfig = newConfig
    }
}
