//
//  RequestHeaders.swift
//  Chuck Facts
//
//  Created by LEANDRO CISSOTO RAMOS on 12/19/18.
//  Copyright © 2018 LEANDRO CISSOTO RAMOS. All rights reserved.
//

import Foundation
import StoreKit

enum RequestHeaders: HeaderSetup {
    case normal
    case custom([String: String])
    var header: [String: String] {
        var headerDic = generateDefaultHeader()
        switch self {
        case .normal:
            headerDic = generateDefaultHeader()
        case .custom(let headers):
            headerDic = headers
        }
        return headerDic
    }
    // Helpers
    private func generateDefaultHeader() -> [String: String] {
        return ["Content-Type": "application/json; charset=utf-8",
                "Accept": "application/json; charset=utf-8"]
    }
}
