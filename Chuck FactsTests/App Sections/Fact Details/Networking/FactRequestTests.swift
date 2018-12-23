//
//  FactRequestTests.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/23/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import XCTest
@testable import Chuck_Facts

class FactRequestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFactRequestWithSuccess() {
        let exp = expectation(description: "Fact success")
        
        let factRequester = FactRequester()
        let factRequests = FactRequests(service: factRequester)
        
        factRequests.getFact(in: "test") { (result) in
            switch result {
            case .success(let fact):
                XCTAssertNotNil(fact)
            case .error:
                XCTFail("How do you defeat me in \(#function), code?")
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testFactRequestWithError() {
        let exp = expectation(description: "Fact error")
        
        var factRequester = FactRequester()
        factRequester.isMockFailure = true
        let factRequests = FactRequests(service: factRequester)
        
        factRequests.getFact(in: "test") { (result) in
            switch result {
            case .success:
                XCTFail("How do you defeat me in \(#function), code?")
            case .error(let error):
                XCTAssertNotNil(error)
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }

}
