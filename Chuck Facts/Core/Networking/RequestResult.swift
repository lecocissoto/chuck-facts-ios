//
//  NetworkResult.swift
//  Chuck Facts
//
//  Created by LEANDRO CISSOTO RAMOS on 12/19/18.
//  Copyright © 2018 LEANDRO CISSOTO RAMOS. All rights reserved.
//

import Foundation

public enum RequestResult<Object: Codable> {
    case success(Object?)
    case error(RequestError?)
}

struct RequestResultFactory<Object: Codable> {
    static func generateResult(with data: Data?,
                               error: RequestError?) -> RequestResult<Object> {
        guard let error = error else {
            if let model = Object.parse(from: data) {
                return RequestResult.success(model)
            }
            return RequestResult.error(.couldNotParseResponse)
        }
        return RequestResult.error(error)
    }
}
