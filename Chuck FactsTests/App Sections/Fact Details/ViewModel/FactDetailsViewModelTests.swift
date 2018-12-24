//
//  FactDetailsViewModelTests.swift
//  Chuck FactsTests
//
//  Created by LEANDRO CISSOTO RAMOS on 24/12/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import XCTest
@testable import Chuck_Facts
import RxSwift

class FactDetailsViewModelTests: XCTestCase {
    var disposeBag = DisposeBag()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetCategoriesWithSuccess() {
        let exp = expectation(description: "Get facts with success")
        let viewModel = FactDetailsViewModel(requestProvider: FactRequestsMock())
    
        viewModel.fact.asObservable().subscribe(onNext: { fact in
            guard let fact = fact else { return }
            XCTAssertNotNil(fact)
            exp.fulfill()
        }).disposed(by: disposeBag)
        
        viewModel.requestForFact()
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func testGetCategoriesWithError() {
        let exp = expectation(description: "Get facts with error")
        var requestMock = FactRequestsMock()
        requestMock.isMockErrored = true
        
        let viewModel = FactDetailsViewModel(requestProvider: requestMock)
        
        viewModel.error.asObservable().subscribe(onNext: { error in
            guard let error = error else { return }
            XCTAssertNotNil(error)
            exp.fulfill()
        }).disposed(by: disposeBag)
        
        viewModel.requestForFact()
        waitForExpectations(timeout: 0.1, handler: nil)
    }
}
