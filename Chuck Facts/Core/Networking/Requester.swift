//
//  Requester.swift
//  Chuck Facts
//
//  Created by LEANDRO CISSOTO RAMOS on 12/19/18.
//  Copyright © 2018 LEANDRO CISSOTO RAMOS. All rights reserved.
//

import Foundation
import Reachability

struct Requester: RequestSetup {
    func request(service: EndpointSetup,
                 completion: @escaping (Data?, RequestError?) -> Void) {
        guard Reachability()?.connection != .none else {
            completion(nil, RequestErrorFactory.generateNoInternetError())
            return
        }
        let session    = URLSession.create()
        session
            .dataTask(with: service.request, completionHandler: { (data, response, error) in
                if let error = RequestErrorFactory.generateResponseError(checking: response,
                                                                         and: error) {
                    completion(nil, error)
                } else if let data = data {
                    completion(data, nil)
                } else {
                    completion(nil, RequestError.serverError)
                }
            }).resume()
        session.finishTasksAndInvalidate()
    }
}
