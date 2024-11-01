// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

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
