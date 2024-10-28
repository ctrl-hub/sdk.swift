//
//  APIRequestInterceptor.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 28/10/2024.
//

import Foundation
import Alamofire

final class APIRequestInterceptor: RequestInterceptor, Sendable {

    let accessToken: String = ""

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.headers.add(name: "X-Session-Token", value: accessToken)
        completion(.success(urlRequest))
    }

}
