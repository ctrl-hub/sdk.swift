//
//  RoleSerializers.swift
//  CtrlHub
//
//  Created by Andrew Waters on 29/10/2024.
//

import Foundation
import JSONAPI
import Alamofire

final class RolesSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> [Role] {
        let decoder = JSONAPIDecoder()
        return try decoder.decode([Role].self, from: data!)
    }
}

final class RoleSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> Role {
        let decoder = JSONAPIDecoder()
        return try decoder.decode(Role.self, from: data!)
    }
}
