//
//  Serializer.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 28/10/2024.
//

import Foundation
import JSONAPI
import Alamofire

final class JSONAPISerializer: ResponseSerializer {
  func serialize(request: URLRequest?,
                 response: HTTPURLResponse?,
                 data: Data?,
                 error: Error?) throws -> [ServiceAccount] {
      let decoder = JSONAPIDecoder()
      return try decoder.decode([ServiceAccount].self, from: data!)
  }
}
