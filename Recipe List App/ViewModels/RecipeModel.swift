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
    
}
