//
//  RecipeTests.swift
//  ColesRecipes
//
//  Created by Yunju Yang on 17/4/2025.
//

import XCTest
@testable import ColesRecipes

final class RecipeTests: XCTestCase {
    
    func testRecipeDecoding() throws {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "recipesSample", withExtension: "json") else {
            XCTFail("Missing recipesSample.json")
            return
        }

        let data = try Data(contentsOf: url)
        let response = try JSONDecoder().decode(RecipeResponse.self, from: data)
        let recipe = response.recipes.first!

        XCTAssertEqual(recipe.title, "Curtis Stone's tomato and bread salad with BBQ eggplant and capsicum")
        XCTAssertEqual(recipe.thumbnail, "/content/dam/coles/inspire-create/thumbnails/Tomato-and-bread-salad-480x288.jpg")
        XCTAssertEqual(recipe.ingredients.first?.item, "1 cup (250ml) extra virgin olive oil")
        XCTAssertEqual(recipe.ingredients.first?.note, "divided")
    }
}
