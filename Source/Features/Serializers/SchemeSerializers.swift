//
//  StreetSerializers.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 29/10/2024.
//

import Foundation
import JSONAPI
import Alamofire

final class SchemesSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> [Scheme] {
        let decoder = JSONAPIDecoder()
        return try decoder.decode([Scheme].self, from: data!)
    }
}

final class SchemeSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> Scheme {
        let decoder = JSONAPIDecoder()
        return try decoder.decode(Scheme.self, from: data!)
    }
}
