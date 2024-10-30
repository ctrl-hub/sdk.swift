//
//  PropertySerializers.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 29/10/2024.
//

import Foundation
import JSONAPI
import Alamofire

final class PropertiesSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> [Property] {
        let decoder = JSONAPIDecoder()
        return try decoder.decode([Property].self, from: data!)
    }
}

final class PropertySerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> Property {
        let decoder = JSONAPIDecoder()
        return try decoder.decode(Property.self, from: data!)
    }
}
