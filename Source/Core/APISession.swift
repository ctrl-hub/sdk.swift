//
//  APISession.swift
//  CtrlHubAPI
//
//  Created by Andrew Waters on 28/10/2024.
//

import Alamofire

class APISession {

    static let `default` = APISession().session

    private let session: Session

    private init() {
        session = Session(interceptor: APIRequestInterceptor())
    }
}