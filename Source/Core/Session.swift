// Unless explicitly stated otherwise all files in this repository are licensed under
// the MIT License.
//
// This product includes software developed at Ctrl Hub (https://www.ctrl-hub.com).
// Copyright 2024-Present Ctrl Hub Limited.

import Alamofire

class CtrlHubSession {

    static let api = CtrlHubSession().session

    private let session: Session

    private init() {
        session = Session(interceptor: AuthInterceptor())
    }
}
