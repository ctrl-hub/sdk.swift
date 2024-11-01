//
//  StreetSerializers.swift
//  CtrlHub
//
//  Created by Andrew Waters on 29/10/2024.
//

import Foundation
import JSONAPI
import Alamofire

typealias SchemeDocument = CompoundDocument<Scheme, SchemesMeta>
typealias SchemesDocument = CompoundDocument<[Scheme], SchemesMeta>

final class SchemesSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> [Scheme] {
        let decoder = JSONAPIDecoder()

        let document = try decoder.decode(SchemesDocument.self, from: data!)
        debugPrint(document.meta)
        return document.data
    }
}

final class SchemeSerializer: ResponseSerializer {
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> Scheme {
        let decoder = JSONAPIDecoder()
        let document = try decoder.decode(SchemeDocument.self, from: data!)
        return document.data
    }
}
