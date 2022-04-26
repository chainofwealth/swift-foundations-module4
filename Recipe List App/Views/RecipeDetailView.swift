//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Denis O'Brien on 4/25/22.
//

import SwiftUI

struct RecipeDetailView: View {
//    @ObservedObject var model = RecipeModel()
    var recipe:Recipe
    
    var body: some View {
        ScrollView{
            
            VStack(alignment:.leading){
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
        
                
                //MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top,.bottom], 5)
                    ForEach(recipe.ingredients, id: \.self){ item in
                        Text("• " + item)
                            .padding(.bottom, 1)
                        
                    }
                    
                }
                .padding(.leading, 5)
                
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                VStack(alignment:.leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.top,.bottom], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        Text(String(index+1) + ". " + recipe.directions[index])
            
                    .padding(.bottom, 5)
                    }
                }
                .padding(.leading, 5)
                }
            
            
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
   
}
