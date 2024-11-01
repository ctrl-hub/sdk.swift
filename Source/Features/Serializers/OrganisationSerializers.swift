//
//  OrganisationSerializers.swift
//  CtrlHub
//
//  Created by Andrew Waters on 29/10/2024.
//

import Foundation
import JSONAPI
import Alamofire

final class OrganisationsSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> [Organisation] {
        let decoder = JSONAPIDecoder()
        return try decoder.decode([Organisation].self, from: data!)
    }
}

final class OrganisationSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> Organisation {
        let decoder = JSONAPIDecoder()
        return try decoder.decode(Organisation.self, from: data!)
    }
}
