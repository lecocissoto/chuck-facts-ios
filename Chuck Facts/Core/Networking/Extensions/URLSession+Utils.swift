//
//  URLSession+Utils.swift
//  Chuck Facts
//
//  Created by LEANDRO CISSOTO RAMOS on 21/11/18.
//  Copyright © 2018 LEANDRO CISSOTO RAMOS. All rights reserved.
//

import Foundation

extension URLSession {
    static func create(config: URLSessionConfiguration = .default) -> URLSession {
        return URLSession(configuration: config)
    }
}
