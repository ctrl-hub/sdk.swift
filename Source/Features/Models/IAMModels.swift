// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI

// MARK: - Resources

@ResourceWrapper(type: "users")
public struct User: Sendable, Equatable, Identifiable {
    public var id: String

    @ResourceAttribute() public var email: String

    @ResourceAttribute() public var profile: Profile
}

public struct Profile: Codable, Equatable, Sendable {
    
    public var address: ProfileAddress

    public var contact: ProfileContact

    public var personal: ProfilePersonal

    public var settings: ProfileSettings

    public var work: ProfileWork
}

public struct ProfileAddress: Codable, Equatable, Sendable {
    
    public var area: String
    
    public var countryCode: String
    
    public var county: String
    
    public var name: String
    
    public var number: String
    
    public var postcode: String
    
    public var street: String
    
    public var town: String
    
    public var what3words: String
    
    enum CodingKeys: String, CodingKey {
        case area
        case countryCode = "country_code"
        case county
        case name
        case number
        case postcode
        case street
        case town
        case what3words
    }
}

public struct ProfileContact: Codable, Equatable, Sendable {
    
    public var landline: String
    
    public var mobile: String
}

public struct ProfilePersonal: Codable, Equatable, Sendable {
    public var dob: String
    
    public var firstName: String
    
    public var lastName: String
    
    public var username: String
    
    enum CodingKeys: String, CodingKey {
        case dob
        case firstName = "first_name"
        case lastName = "last_name"
        case username
    }
}

public struct ProfileSettings: Codable, Equatable, Sendable {
    public var preferredLanguage: String

    public var timezone: String

    enum CodingKeys: String, CodingKey {
        case preferredLanguage = "preferred_language"
        case timezone
    }
}

public struct ProfileWork: Codable, Equatable, Sendable {
    public var cscs: String
    
    public var eusr: String
    
    public var occupation: String
    
    public var startDate: String
    
    enum CodingKeys: String, CodingKey {
        case cscs
        case eusr
        case occupation
        case startDate = "start_date"
    }
}
