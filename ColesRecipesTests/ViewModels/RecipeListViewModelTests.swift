//
//  RecipeListViewModelTests.swift
//  ColesRecipes
//
//  Created by Yunju Yang on 17/4/2025.
//

import XCTest
@testable import ColesRecipes

final class RecipeListViewModelTests: XCTestCase {
    
    @MainActor
    func testLoadRecipesLoadsData() {
        let viewModel = RecipeListViewModel()
        viewModel.loadRecipes()
        
        XCTAssertFalse(viewModel.recipes.isEmpty, "Recipes should be loaded from JSON.")
        XCTAssertEqual(viewModel.recipes.first?.title, "Curtis Stone's tomato and bread salad with BBQ eggplant and capsicum")
    }
}
