//
//  RequestHeadersTests.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/22/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import XCTest
@testable import Chuck_Facts

class RequestHeadersTests: XCTestCase {

    override func setUp() {}
    
    override func tearDown() {}
    
    func testNormalHeader() {
        let headerConfig = RequestHeaders.normal
        XCTAssertEqual(headerConfig.header, ["Content-Type": "application/json; charset=utf-8",
                                             "Accept": "application/json; charset=utf-8"])
    }
    
    func testCustomHeader() {
        let headerConfig = RequestHeaders.custom(["Chuck": "Norris"])
        XCTAssertEqual(headerConfig.header, ["Chuck": "Norris"])
    }
}
