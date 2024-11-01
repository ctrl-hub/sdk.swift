//
//  Location.swift
//  CtrlHub
//
//  Created by Andrew Waters on 27/10/2024.
//

import Foundation

public struct PointLocation: Codable, Equatable, Sendable {

    /// The geospatial coordinates of the property which will be an array of exactly two floats
    /// The first value is the longitude
    /// The second value is the latitude
    public var coordinates: [Double]

    /// The type of geosptial data, `Point`
    public var type: String
}

public struct MultiLineString: Codable, Equatable, Sendable {

    /// The geospatial coordinates of the property which will be an array of an array of floats
    public var coordinates: [[[Double]]]

    /// The type of geosptial data, `MultiLineString`
    public var type: String
}
