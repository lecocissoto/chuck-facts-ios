//
//  FactDetailsRequests.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/19/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation

protocol FactRequestsProvider: NetworkingDataSetup {
    func getFact(in category: Category, completion: ((RequestResult<Fact>) -> Void)?)
}

struct FactRequests: FactRequestsProvider {
    var service: RequestSetup = Requester()

    func getFact(in category: Category, completion: ((RequestResult<Fact>) -> Void)?) {
        let endpoint = FactEndpoints.getFact(category)
        service.request(service: endpoint) { (data, error)  in
            completion?(RequestResultFactory.generateResult(with: data, error: error))
        }
    }
}
