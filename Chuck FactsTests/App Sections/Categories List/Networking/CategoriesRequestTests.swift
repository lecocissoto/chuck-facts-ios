//
//  CategoriesRequestTests.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/23/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import XCTest
@testable import Chuck_Facts

class CategoriesRequestTests: XCTestCase {

    override func setUp() { }

    override func tearDown() { }

    func testCategoriesRequestWithSuccess() {
        let exp = expectation(description: "Categories success")
        
        let categoriesRequester = CategoriesRequester()
        let categoriesRequestes = CategoriesRequests(service: categoriesRequester)
    
        categoriesRequestes.getCategories { (result) in
            switch result {
            case .success(let categories):
                XCTAssertNotNil(categories)
            case .error:
                XCTFail("How do you defeat me in \(#function), code?")
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testCategoriesRequestWithError() {
        let exp = expectation(description: "Categories error")
        
        var categoriesRequester = CategoriesRequester()
        categoriesRequester.isMockFailure = true
        
        let categoriesRequestes = CategoriesRequests(service: categoriesRequester)
        
        categoriesRequestes.getCategories { (result) in
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
