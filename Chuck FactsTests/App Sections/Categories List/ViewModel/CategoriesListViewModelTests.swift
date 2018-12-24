//
//  CategoriesListViewModelTests.swift
//  Chuck FactsTests
//
//  Created by LEANDRO CISSOTO RAMOS on 24/12/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import XCTest
@testable import Chuck_Facts
import RxSwift
import RxCocoa

class CategoriesListViewModelTests: XCTestCase {
    var disposeBag = DisposeBag()

    override func setUp() { }

    override func tearDown() { }
    
    func testGetCategoriesWithSuccess() {
        let exp = expectation(description: "Get categories with success")
        let viewModel = CategoriesListViewModel(requestProvider: CategoriesRequestMock())
        
        viewModel.categories.asObservable().subscribe(onNext: { categories in
            if categories.count > 0 {
                XCTAssertGreaterThan(categories.count, 0)
                exp.fulfill()
            }
            
        }).disposed(by: disposeBag)
        
        viewModel.requestForCategories()
    
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func testGetCategoriesWithError() {
        let exp = expectation(description: "Get categories with error")
        var requestMock = CategoriesRequestMock()
        requestMock.isMockErrored = true
        
        let viewModel = CategoriesListViewModel(requestProvider: requestMock)
        
        viewModel.error.asObservable().subscribe(onNext: { error in
            guard let error = error else { return }
            XCTAssertNotNil(error)
            exp.fulfill()
        }).disposed(by: disposeBag)
        viewModel.requestForCategories()
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func testNavigateTo() {
        let viewModel = CategoriesListViewModel()
        viewModel.navigate(to: .factSegue)
        
        XCTAssertNotNil(viewModel.destination)
    }
}
