//
//  CategoriesRequestsMock.swift
//  Chuck FactsTests
//
//  Created by LEANDRO CISSOTO RAMOS on 24/12/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation
@testable import Chuck_Facts

struct CategoriesRequestMock: CategoriesRequestsProvider {
    var service: RequestSetup
    var isMockErrored = false
    
    init(service: RequestSetup = CategoriesRequester()) {
        self.service = service
    }
    
    func getCategories(completion: ((RequestResult<[String]>) -> Void)?) {
        if isMockErrored {
            completion?(.error(RequestError.couldNotFoundURL))
            return
        }
        completion?(.success(CategoriesMock.getObject()))
    }
}
