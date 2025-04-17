//
//  RecipeListViewUITests.swift
//  ColesRecipes
//
//  Created by Yunju Yang on 17/4/2025.
//

import XCTest

final class RecipeListViewUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testRecipeListLoadsAndNavigatesToDetail() {
        // Access the scrollable view and locate the first recipe cell
        let collection = app.scrollViews.otherElements
        let firstRecipe = collection.staticTexts["Curtis Stone's tomato and bread salad with BBQ eggplant and capsicum"]

        // Assert the first recipe appears and can be tapped
        XCTAssertTrue(firstRecipe.waitForExistence(timeout: 5))
        firstRecipe.tap()

        // Verify that navigation to detail screen occurred
        let navBar = app.navigationBars["Recipe"]
        XCTAssertTrue(navBar.waitForExistence(timeout: 2))
    }
}
