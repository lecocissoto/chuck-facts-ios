//
//  FactDetailsRequests.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/19/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation

protocol FactDetailsRequestsProvider: NetworkingDataSetup {
    func getFact(in category: Category, completion: ((RequestResult<Fact>) -> Void)?)
}

struct FactDetailsRequests: FactDetailsRequestsProvider {
    var service: RequestSetup = Requester()

    func getFact(in category: Category, completion: ((RequestResult<Fact>) -> Void)?) {
        let endpoint = FactDetailsEndpoints.getFact(category)
        service.request(service: endpoint) { (data, error)  in
            completion?(RequestResultFactory.generateResult(with: data, error: error))
        }
    }
}
