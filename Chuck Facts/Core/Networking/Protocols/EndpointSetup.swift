//
//  EndpointSetup.swift
//  Chuck Facts
//
//  Created by LEANDRO CISSOTO RAMOS on 12/19/18.
//  Copyright © 2018 LEANDRO CISSOTO RAMOS. All rights reserved.
//

import Foundation

typealias Path = (uri: String, method: RequestMethod)
typealias EndpointConfig = (timeoutInterval: TimeInterval?, cachePolicy: URLRequest.CachePolicy?)
typealias RequestBody = [String: Any]

protocol EndpointSetup {
    var config: EndpointConfig? { get }
    var header: HeaderSetup { get }
    var body: RequestBody? { get }
    var baseURL: String { get }
    var path: Path { get }
    var url: URL { get }
    var request: URLRequest { get }
}

extension EndpointSetup {
    var config: EndpointConfig? { return nil }
    var header: HeaderSetup { return RequestHeaders.normal }
    var body: RequestBody? { return nil }
    var hasCache: Bool {
        return false
    }
    var baseURL: String {
        return API().stringURL
    }
    var url: URL {
        let stringURL = baseURL + path.uri
        guard let url = URL(string: stringURL) else {
            return URL(string: stringURL + "/404")!
        }
        return url
    }
    var request: URLRequest {
        return URLRequest.create(with: self)
    }
}
