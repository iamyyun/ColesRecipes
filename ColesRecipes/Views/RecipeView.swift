//
//  RecipeView.swift
//  ColesRecipes
//
//  Created by Yunju Yang on 16/4/2025.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Thumbnail image
                AsyncImage(url: URL(string: "http://www.coles.com.au" + recipe.thumbnail)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 240)
                        .clipped()
                } placeholder: {
                    Color.gray.frame(height: 240)
                }

                VStack(alignment: .leading, spacing: 8) {
                    // Title and description
                    Text(recipe.title)
                        .font(.title)
                        .bold()
                    
                    Text(recipe.description)
                        .font(.body)
                        .padding(.top, 5)

                    // Serves, prep and cook information
                    HStack {
                        VStack(alignment: .leading) {
                            Label {
                                Text("Serves")
                            } icon: {
                                Image(systemName: "person.2")
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            Text("\(recipe.details.amountNumber)")
                                .font(.callout)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Label {
                                Text("Prep")
                            } icon: {
                                Image(systemName: "timer")
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            HStack {
                                Text(recipe.details.prepTime)
                                    .font(.callout)
                                Text(recipe.details.prepNote ?? "")
                                    .font(.caption2)
                            }
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Label {
                                Text("Cook")
                            } icon: {
                                Image(systemName: "timer")
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            Text(recipe.details.cookingTime)
                                .font(.callout)
                        }
                    }
                    .padding(.vertical)

                    Divider()

                    // Ingredient list
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.top, 10)
                    
                    ForEach(recipe.ingredients) { ingredient in
                        HStack(alignment: .top) {
                            Text("• \(ingredient.item)")
                                .font(.body) +
                            Text("  \(ingredient.note)")
                                .font(.callout)
                                .foregroundColor(.secondary)
                        }
                        .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Recipe")
        .navigationBarTitleDisplayMode(.inline)
    }
}
