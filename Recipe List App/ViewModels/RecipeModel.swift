//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Denis O'Brien on 4/25/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        self.recipes = DataService.getLocalData()
        
    }
    
    
    static func getPortion(servSize:Int, portions:Int, ingredient:Ingredient)->String{
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholeportions = 0
        
        if ingredient.num != nil {
            
            denominator *= portions
            numerator *= servSize
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            if numerator >= denominator {
                wholeportions = numerator/denominator
                numerator = numerator % denominator
            }
            if wholeportions != 0 {
               portion += String(wholeportions) + " "
            }
            if numerator > 0 {
                portion += "\(numerator)/\(denominator)"
            }
            
        }
        if var unit = ingredient.unit {

             if wholeportions > 1{
            if unit.suffix(2) == "ch" {
             unit += "es"
            } else if unit.suffix(1) == "f" {
                unit = String(unit.dropLast()) + "ves"
            } else {
                unit += "s"
            }
            }
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
            
        }
        
        return portion
        
        
        
        
    }
    
}
