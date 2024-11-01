//
//  Session.swift
//  CtrlHub
//
//  Created by Andrew Waters on 28/10/2024.
//

import Alamofire

class CtrlHubSession {

    static let api = CtrlHubSession().session

    private let session: Session

    private init() {
        session = Session(interceptor: AuthInterceptor())
    }
}
