//
//  RecipeResponseTests.swift
//  ColesRecipes
//
//  Created by Yunju Yang on 17/4/2025.
//

import XCTest
@testable import ColesRecipes

final class RecipeResponseTests: XCTestCase {

    func testRecipeResponseDecoding() throws {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "recipesSample", withExtension: "json") else {
            XCTFail("Missing recipesSample.json")
            return
        }

        let data = try Data(contentsOf: url)
        let response = try JSONDecoder().decode(RecipeResponse.self, from: data)

        XCTAssertEqual(response.recipes.count, 8)
        XCTAssertNotNil(response.recipes.first)
    }
}
