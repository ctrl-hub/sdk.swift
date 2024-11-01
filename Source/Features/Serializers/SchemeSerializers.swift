// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

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
