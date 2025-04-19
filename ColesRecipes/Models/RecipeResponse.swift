//
//  RecipeResponse.swift
//  ColesRecipes
//
//  Created by Yunju Yang on 16/4/2025.
//

/// A model to decode a list of recipes from JSON.
struct RecipeResponse: Codable {
    let recipes: [Recipe]
}
