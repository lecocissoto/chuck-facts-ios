//
//  FactsEndpointsTests.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/23/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import XCTest
@testable import Chuck_Facts

class FactsEndpointsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCategoriesEndpointConfiguration() {
        let endpoint = FactEndpoints.getFact("test")
        
        XCTAssertEqual(endpoint.path.uri, "/jokes/random?category=test")
        XCTAssertEqual(endpoint.path.method, .get)
    }
}
