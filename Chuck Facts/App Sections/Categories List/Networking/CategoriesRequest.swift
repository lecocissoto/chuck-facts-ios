//
//  CategoriesRequest.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/19/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation

protocol CategoriesRequestsProvider: NetworkingDataSetup {
    func getCategories(completion: ((RequestResult<Categories>) -> Void)?)
}

struct CategoriesRequests: CategoriesRequestsProvider {
    var service: RequestSetup = Requester()
    
    func getCategories(completion: ((RequestResult<Categories>) -> Void)?) {
        let endpoint = CategoriesEndpoints.categories
        service.request(service: endpoint) { (data, error)  in
            completion?(RequestResultFactory.generateResult(with: data, error: error))
        }
    }
}
