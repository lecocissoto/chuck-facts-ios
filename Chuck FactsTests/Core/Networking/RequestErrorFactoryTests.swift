//
//  RequestErrorFactoryTests.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/22/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import XCTest
@testable import Chuck_Facts

class RequestErrorFactoryTests: XCTestCase {
    override func setUp() {}
    override func tearDown() {}
    
    func testInternetError() {
        XCTAssertNotNil(RequestErrorFactory.generateNoInternetError())
    }
    
    func testResponseErrorWithoutError() {
        let response = HTTPURLResponse(url: URL(string: API().stringURL)!,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)
        let error = RequestErrorFactory.generateResponseError(checking: response, and: nil)
        XCTAssertNil(error)
    }
    
    func testResponseErrorWithNotFoundError() {
        let response = HTTPURLResponse(url: URL(string: API().stringURL)!,
                                       statusCode: 400,
                                       httpVersion: nil,
                                       headerFields: nil)
        let error = RequestErrorFactory.generateResponseError(checking: response, and: nil)
        XCTAssertNotNil(error)
    }
    
    func testResponseErrorWithServerError() {
        let response = HTTPURLResponse(url: URL(string: API().stringURL)!,
                                       statusCode: 500,
                                       httpVersion: nil,
                                       headerFields: nil)
        let error = RequestErrorFactory.generateResponseError(checking: response, and: nil)
        XCTAssertNotNil(error)
    }
    
    func testResponseErrorWithBizzareError() {
        let response = HTTPURLResponse(url: URL(string: API().stringURL)!,
                                       statusCode: 5200,
                                       httpVersion: nil,
                                       headerFields: nil)
        let error = RequestErrorFactory.generateResponseError(checking: response, and: nil)
        XCTAssertNotNil(error)
        switch error! {
        case .genericError(message: let message):
            XCTAssertEqual(message, "Error that even Chuck Norris couldn't explain.")
        default:
            XCTFail("How do you defeat me in \(#function), code?")
        }
        
    }
}
