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
    @MainActor
    func loadRecipes() async {
        do {
            let data = try await fetchLocalJSON(named: "recipesSample")
            let decoded = try JSONDecoder().decode(RecipeResponse.self, from: data)
            self.recipes = decoded.recipes
        } catch {
            print("Failed to load recipes: \(error)")
        }
    }
    
    private func fetchLocalJSON(named filename: String) async throws -> Data {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("Could not find JSON file.")
            throw URLError(.fileDoesNotExist)
        }
        return try Data(contentsOf: url)
    }
}
