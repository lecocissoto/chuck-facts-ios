//
//  URLRequest+Utils.swift
//  Chuck Facts
//
//  Created by LEANDRO CISSOTO RAMOS on 21/11/18.
//  Copyright © 2018 LEANDRO CISSOTO RAMOS. All rights reserved.
//

import Foundation

extension URLRequest {
    static func create(with endpoint: EndpointSetup) -> URLRequest {
        var request = URLRequest(url: endpoint.url,
                                 cachePolicy: endpoint.config?.cachePolicy ?? .returnCacheDataElseLoad,
                                 timeoutInterval: endpoint.config?.timeoutInterval ?? 30.0)
        request.httpMethod = endpoint.path.method.rawValue

        return request
    }
}
