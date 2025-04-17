//
//  Ingredient.swift
//  ColesRecipes
//
//  Created by Yunju Yang on 16/4/2025.
//

import Foundation

public struct Ingredient: Identifiable, Codable, Equatable {
    public var id = UUID()
    public let item: String
    public let note: String
    
    public init(item: String, note: String = "") {
        self.item = item
        self.note = note
    }
}
