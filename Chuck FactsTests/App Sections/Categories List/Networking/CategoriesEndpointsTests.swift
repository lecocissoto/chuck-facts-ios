//
//  CategoriesEndpointsTests.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/23/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import XCTest
@testable import Chuck_Facts

class CategoriesEndpointsTests: XCTestCase {

    override func setUp() { }

    override func tearDown() { }

    func testCategoriesEndpointConfiguration() {
        let endpoint = CategoriesEndpoints.categories
        
        XCTAssertEqual(endpoint.path.uri, "/jokes/categories")
        XCTAssertEqual(endpoint.path.method, .get)
    }
}
