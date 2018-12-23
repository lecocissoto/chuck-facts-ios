//
//  APITests.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/22/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import XCTest
@testable import Chuck_Facts

class APITests: XCTestCase {

    override func setUp() {}

    override func tearDown() {}
    
    func testAPIInstance() {
        let api = API()
        XCTAssertEqual(api.stringURL, API.APIBaseURL.production.rawValue)
    }
}
