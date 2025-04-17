//
//  IngredientTests.swift
//  ColesRecipes
//
//  Created by Yunju Yang on 17/4/2025.
//

import XCTest
@testable import ColesRecipes

final class IngredientTests: XCTestCase {
    
    func testIngredientParsingWithNote() {
        let raw = "1 cup (250ml) extra virgin olive oil, divided"
        let parsed = parseIngredient(raw)
        XCTAssertEqual(parsed.item, "1 cup (250ml) extra virgin olive oil")
        XCTAssertEqual(parsed.note, "divided")
    }

    func testIngredientParsingWithoutNote() {
        let raw = "Salt to taste"
        let parsed = parseIngredient(raw)
        XCTAssertEqual(parsed.item, "Salt to taste")
        XCTAssertEqual(parsed.note, "")
    }

    private func parseIngredient(_ raw: String) -> Ingredient {
        let parts = raw.split(separator: ",", maxSplits: 1).map {
            $0.trimmingCharacters(in: .whitespacesAndNewlines)
        }

        if parts.count == 2 {
            return Ingredient(item: parts[0], note: parts[1])
        } else {
            return Ingredient(item: raw)
        }
    }
}
