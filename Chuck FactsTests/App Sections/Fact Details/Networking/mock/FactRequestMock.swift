//
//  FactRequestMock.swift
//  Chuck FactsTests
//
//  Created by LEANDRO CISSOTO RAMOS on 24/12/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation
@testable import Chuck_Facts

struct FactRequestsMock: FactRequestsProvider {
    var service: RequestSetup
    var isMockErrored = false
    
    init(service: RequestSetup = FactRequester()) {
        self.service = service
    }
    
    func getFact(in category: String, completion: ((RequestResult<Fact>) -> Void)?) {
        if isMockErrored {
            completion?(.error(RequestError.couldNotFoundURL))
            return
        }
        completion?(.success(FactMock.getObject()))
    }
}
