//
//  RequestResultFactoryTests.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/22/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import XCTest
@testable import Chuck_Facts

class RequestResultFactoryTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequestResultFactoryWithError() {
        let result = RequestResultFactory<[String]>.generateResult(with: nil, error: RequestError.noInternetConnection)
        switch result {
        case .error(let error):
            XCTAssertNotNil(error)
        default:
            XCTFail("How do you defeat me in \(#function), code?")
        }
    }
    
    func testRequestResultFactoryWithErrorUsingWrongObject() {
        let result = RequestResultFactory<[String]>.generateResult(with: Data(), error: nil)
        switch result {
        case .error(let error):
            XCTAssertNotNil(error)
        default:
            XCTFail("How do you defeat me in \(#function), code?")
        }
    }
    
    func testRequestResultFactorySuccess() {
        let jsonString = """
                            [ "Chuck", "Norris", "Forever" ]
                         """
        let result = RequestResultFactory<[String]>.generateResult(with: jsonString.data(using: .utf8),
                                                                   error: nil)
        switch result {
        case .success(let object):
            XCTAssertNotNil(object)
        default:
            XCTFail("How do you defeat me in \(#function), code?")
        }
    }

}
