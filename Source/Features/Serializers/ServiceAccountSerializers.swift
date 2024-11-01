// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Foundation
import JSONAPI
import Alamofire

final class ServiceAccountsSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> [ServiceAccount] {
        let decoder = JSONAPIDecoder()
        return try decoder.decode([ServiceAccount].self, from: data!)
    }
}

final class ServiceAccountSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> ServiceAccount {
        let decoder = JSONAPIDecoder()
        return try decoder.decode(ServiceAccount.self, from: data!)
    }
}

final class RequestLogsSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> [RequestLog] {
        let decoder = JSONAPIDecoder()
        return try decoder.decode([RequestLog].self, from: data!)
    }
}

final class RequestLogSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> RequestLog {
        let decoder = JSONAPIDecoder()
        return try decoder.decode(RequestLog.self, from: data!)
    }
}
