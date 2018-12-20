//
//  API.swift
//  Chuck Facts
//
//  Created by LEANDRO CISSOTO RAMOS on 12/19/18.
//  Copyright © 2018 LEANDRO CISSOTO RAMOS. All rights reserved.
//

import Foundation

struct API: APISetup {
    enum APIBaseURL: String {
        case production = "https://api.chucknorris.io"
    }
    private let baseURL: APIBaseURL
    var stringURL: String {
         return baseURL.rawValue
    }
    init(baseURL: APIBaseURL = .production) {
        self.baseURL = baseURL
    }
}
