//
//  ServiceAccountSerializers.swift
//  CtrlHub
//
//  Created by Andrew Waters on 29/10/2024.
//

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
