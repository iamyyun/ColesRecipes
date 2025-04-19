//
//  Detail.swift
//  ColesRecipes
//
//  Created by Yunju Yang on 16/4/2025.
//

import Foundation

/// A model representing preparation and cooking details for a recipe.
public struct Detail: Codable, Equatable {
    public let amountLabel: String
    public let amountNumber: Int
    public let prepLabel: String
    public let prepTime: String
    public let prepNote: String?
    public let cookingLabel: String
    public let cookingTime: String
    public let cookTimeAsMinutes: Int
    public let prepTimeAsMinutes: Int
}
