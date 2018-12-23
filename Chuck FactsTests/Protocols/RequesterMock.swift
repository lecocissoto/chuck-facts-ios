//
//  RequesterMock.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/23/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation
@testable import Chuck_Facts

protocol RequesterMock: RequestSetup {
    associatedtype MockedObject: Mock
    var isMockFailure: Bool { get set }
}

extension RequesterMock {
    func request(service: EndpointSetup, completion: @escaping (Data?, RequestError?) -> Void) {
        if isMockFailure {
            completion(nil, RequestError.serverError)
            return
        }
        completion(MockedObject.toData(), nil)
    }
}
