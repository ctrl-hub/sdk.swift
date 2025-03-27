// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation

public struct PointLocation: Codable, Equatable, Sendable {

    /// The geospatial coordinates of the property which will be an array of exactly two floats
    /// The first value is the longitude
    /// The second value is the latitude
    public var coordinates: [Double]

    /// The type of geosptial data, `Point`
    public var type: String
    
    public init(coordinates: [Double], type: String) {
        self.coordinates = coordinates
        self.type = type
    }
}

public struct MultiLineString: Codable, Equatable, Sendable {

    /// The geospatial coordinates of the property which will be an array of an array of floats
    public var coordinates: [[[Double]]]

    /// The type of geosptial data, `MultiLineString`
    public var type: String
}
