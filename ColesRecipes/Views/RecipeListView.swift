//
//  RecipeListView.swift
//  ColesRecipes
//
//  Created by Yunju Yang on 16/4/2025.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeListViewModel()

    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        GeometryReader { geometry in
            let horizontalPadding: CGFloat = 12
            let spacing: CGFloat = 12
            let cardWidth = (geometry.size.width - (horizontalPadding * 2 + spacing)) / 2
            
            NavigationView {
                ScrollView {
                    // Grid of recipe cards
                    LazyVGrid(columns: columns, spacing: spacing) {
                        ForEach(viewModel.recipes) { recipe in
                            // Navigation to detailed recipe view
                            NavigationLink(destination: RecipeView(recipe: recipe)) {
                                ZStack(alignment: .top) {
                                    Color.clear // invisible layer for height equalization
                                    
                                    VStack(spacing: 0) {
                                        // Recipe thumbnaill image
                                        AsyncImage(url: URL(string: "http://www.coles.com.au" + recipe.thumbnail)) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(height: 150)
                                                .clipped()
                                        } placeholder: {
                                            Color.gray.frame(height: 150)
                                        }

                                        // Recipe title and prep/cook times
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(recipe.title)
                                                .font(.headline)
                                                .fixedSize(horizontal: false, vertical: true)

                                            Text("Prep: \(recipe.details.prepTime), Cook: \(recipe.details.cookingTime)")
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                                .fixedSize(horizontal: false, vertical: true)
                                        }
                                        .padding(6)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color(.systemGray6))
                                    }
                                    .frame(width: cardWidth)
                                    .fixedSize(horizontal: false, vertical: false)
                                    .cornerRadius(10)
                                    .zIndex(0)
                                    .background(HeightEqualizer())
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, horizontalPadding)
                    .padding(.top, 12)
                }
                .navigationTitle("Coles Recipes")
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear {
                // Load recipes from local JSON
                viewModel.loadRecipes()
            }
        }
    }
}

/// ViewModifier to equalize height of grid items
fileprivate var maxHeight: CGFloat = 0  // shared height storage

struct HeightEqualizer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            maxHeight = max(maxHeight, proxy.size.height)
                        }
                }
            )
            .frame(height: maxHeight > 0 ? maxHeight : nil)
    }
}

extension View {
    func background(_ modifier: HeightEqualizer) -> some View {
        self.modifier(modifier)
    }
}
