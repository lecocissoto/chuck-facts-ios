//
//  Chuck_FactsUITests.swift
//  Chuck FactsUITests
//
//  Created by Leandro Cissoto Ramos on 12/18/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import XCTest

class ChuckFactsUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
    }
    
    // swiftlint:disable:next line_length
    func testAppWithAPIIntegration() {
        let app = XCUIApplication()
        let tableView = app.tables["CategoriesTable"]
        _ = tableView.waitForExistence(timeout: 10.0)
        XCTAssert(tableView.cells.count > 0)
        
        let cells = tableView
                    .children(matching: .cell)
                    .matching(identifier: "CategoryCell")
        
        XCTAssert(cells.element(boundBy: 0).isHittable)
        cells.element(boundBy: 0).tap()
        
        let textLabel = app.staticTexts["FactLabel"]
        XCTAssert(textLabel.waitForExistence(timeout: 10.0))
        XCTAssert(textLabel.label.count > 1)
        
        let button = app/*@START_MENU_TOKEN@*/.buttons["GoToWebsiteButton"]/*[[".buttons[\"See in the website\"]",".buttons[\"GoToWebsiteButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(button.waitForExistence(timeout: 10.0))
    }

}
