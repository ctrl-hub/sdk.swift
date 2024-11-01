// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation

/**
 CountMeta is the standard representation indicating the number of resources available in the API
 which is presented when performing a Many request
 */
public struct CountMeta: Sendable, Equatable, Codable {

    /// The current limit on the request
    public var limit: Int
    
    /// The total number of resources available in the API
    public var total: Int
}

/**
 PageMeta is the standard representation of the current paging
 */
public struct PageMeta: Sendable, Equatable, Codable {

    /// The limit in the processed request
    public var limit: Int

    /// page offset information
    public var offset: PageOffsetMeta
}

/**
 PageOffsetMeta is a representation of the actual offset info which you can use to make subsequent paging requests through the API
 */
public struct PageOffsetMeta: Sendable, Equatable, Codable {

    /// The current page offset
    public var current: Int

    /// The next page offset
    public var next: Int?

    /// The previous page offset
    public var previous: Int?
}
