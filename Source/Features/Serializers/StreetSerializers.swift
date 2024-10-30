//
//  StreetSerializers.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 29/10/2024.
//

import Foundation
import JSONAPI
import Alamofire

final class StreetsSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> [Street] {
        let decoder = JSONAPIDecoder()
        return try decoder.decode([Street].self, from: data!)
    }
}

final class StreetSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> Street {
        let decoder = JSONAPIDecoder()
        return try decoder.decode(Street.self, from: data!)
    }
}
