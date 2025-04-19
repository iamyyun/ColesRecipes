//
//  Recipe.swift
//  ColesRecipes
//
//  Created by Yunju Yang on 16/4/2025.
//

import Foundation

/// A model representing a single recipe.
public struct Recipe: Identifiable, Codable, Equatable {
    public let id = UUID()
    public let title: String
    public let description: String
    public let thumbnail: String
    public let thumbnailAlt: String
    public let details: Detail
    public let ingredients: [Ingredient]
    
    enum CodingKeys: String, CodingKey {
        case title = "dynamicTitle"
        case description = "dynamicDescription"
        case thumbnail = "dynamicThumbnail"
        case thumbnailAlt = "dynamicThumbnailAlt"
        case details = "recipeDetails"
        case ingredients
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
        self.thumbnailAlt = try container.decode(String.self, forKey: .thumbnailAlt)
        self.details = try container.decode(Detail.self, forKey: .details)

        /// Decode ingredient array and split comma-separated strings
        let ingredientObjects = try container.decode([[String: String]].self, forKey: .ingredients)
        self.ingredients = ingredientObjects.compactMap { dict in
                    guard let raw = dict["ingredient"]?.trimmingCharacters(in: .whitespacesAndNewlines),
                          !raw.isEmpty else { return nil }

                    let components = raw.split(separator: ",", maxSplits: 1).map {
                        $0.trimmingCharacters(in: .whitespacesAndNewlines)
                    }

                    if components.count == 2 {
                        return Ingredient(item: components[0], note: components[1])
                    } else {
                        return Ingredient(item: raw)
                    }
                }
    }
}
