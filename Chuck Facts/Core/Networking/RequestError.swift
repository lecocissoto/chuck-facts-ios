//
//  RequestError.swift
//  Chuck Facts
//
//  Created by LEANDRO CISSOTO RAMOS on 12/19/18.
//  Copyright © 2018 LEANDRO CISSOTO RAMOS. All rights reserved.
//

import Foundation

public enum RequestError: Error {
    case couldNotParseResponse
    case couldNotFoundURL
    case noInternetConnection
    case serverError
    case unexpected(Error)
    case genericError(message: String)
}

struct RequestErrorFactory {
    static func generateResponseError(checking response: URLResponse?,
                                      and error: Error?) -> RequestError? {
        guard let error = error else {
            guard let urlResponse = response,
                  let response = urlResponse as? HTTPURLResponse else {
                return .serverError
            }
            switch response.statusCode {
            case 200...299:
                return nil
            case 400:
                return .couldNotFoundURL
            case 500...599:
                return .serverError
            default:
                return .genericError(message: "Error that even Chuck Norris couldn't explain.")
            }
        }
        return .unexpected(error)
    }
    
    static func generateNoInternetError() -> RequestError {
        return .noInternetConnection
    }
}
