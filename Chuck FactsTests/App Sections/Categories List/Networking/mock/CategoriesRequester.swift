//
//  CategoriesRequester.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/23/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation
@testable import Chuck_Facts

struct CategoriesRequester: RequesterMock {
    typealias MockedObject = CategoriesMock
    var isMockFailure: Bool = false
}
