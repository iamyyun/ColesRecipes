//
//  RecipeListViewModel.swift
//  ColesRecipes
//
//  Created by Yunju Yang on 16/4/2025.
//

import Foundation

@MainActor
class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    /// Loads recipe data from 'recipesSample.json' and decodes the JSON into 'recipes' property.
    func loadRecipes() {
        guard let url = Bundle.main.url(forResource: "recipesSample", withExtension: "json") else {
            print("Could not find JSON file.")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(RecipeResponse.self, from: data)
            self.recipes = decoded.recipes
        } catch {
            print("Failed to decode: \(error)")
        }
    }
}
