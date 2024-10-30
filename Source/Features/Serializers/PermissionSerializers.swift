//
//  PropertySerializers.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 29/10/2024.
//

import Foundation
import JSONAPI
import Alamofire

final class PermissionsSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> [Permission] {
        let decoder = JSONAPIDecoder()
        return try decoder.decode([Permission].self, from: data!)
    }
}

final class PermissionSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> Permission {
        let decoder = JSONAPIDecoder()
        return try decoder.decode(Permission.self, from: data!)
    }
}
