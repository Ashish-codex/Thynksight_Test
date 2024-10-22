//
//  ModelMeals.swift
//  Thynksight_Test
//
//  Created by Ashish Prajapati on 21/10/24.
//

import Foundation

struct ModelMeals: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let idMeal: String?
    let strMeal: String?
    let strDrinkAlternate: String?
    let strCategory, strArea, strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4: String?
    let strIngredient5, strIngredient6, strIngredient7, strIngredient8: String?
    let strIngredient9, strIngredient10, strIngredient11, strIngredient12: String?
    let strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20: String?

    let strMeasure1, strMeasure2, strMeasure3: String?
    let strMeasure4, strMeasure5, strMeasure6, strMeasure7: String?
    let strMeasure8, strMeasure9, strMeasure10, strMeasure11: String?
    let strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20: String?
    let strSource: String?
    let strImageSource, strCreativeCommonsConfirmed, dateModified: String?
}
