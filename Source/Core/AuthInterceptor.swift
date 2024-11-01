//
//  AuthInterceptor.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 28/10/2024.
//

import Foundation
import Alamofire

/**
 AuthInterceptor acts as an Alamofire RequestInterceptor and automatically attaches the users
 access token to the `X-Session-Token` header which is sent to the API.
 */
final class AuthInterceptor: RequestInterceptor, Sendable {

    // TODO: - get this from AuthManager
    let accessToken: String = ""

    /**
     Adapts the url request with the X-Session-Token header to authenticate the user at the API
     */
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.headers.add(name: "X-Session-Token", value: accessToken)
        completion(.success(urlRequest))
    }

}
