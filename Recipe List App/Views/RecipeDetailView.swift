//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Denis O'Brien on 4/25/22.
//

import SwiftUI

struct RecipeDetailView: View {
//    @ObservedObject var model = RecipeModel()
    @State var selectedServingSize = 2
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView{
            
            VStack(alignment:.leading){
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
        
                //MARK: Recipe Title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                //MARK: Picker
                VStack(alignment:.leading){
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir", size: 15))
                Picker("", selection: $selectedServingSize) {
                    Text("2").tag(2)
                        .font(Font.custom("Avenir", size: 15))
                    Text("4").tag(4)
                        .font(Font.custom("Avenir", size: 15))
                    Text("6").tag(6)
                        .font(Font.custom("Avenir", size: 15))
                    Text("8").tag(8)
                        .font(Font.custom("Avenir", size: 15))
                }.pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                .frame(width:160)
                //MARK: Ingredients
                VStack(alignment: .leading){
                    
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))

                        .padding([.top,.bottom], 5)
                    ForEach(recipe.ingredients){ item in
                        
                        Text("• " + RecipeModel.getPortion(servSize: selectedServingSize, portions: recipe.servings, ingredient: item) + " " + item.name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                            .padding(.bottom, 1)
                        
                    }
                    
                }
                .padding(.leading, 5)
                
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                VStack(alignment:.leading){
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.top,.bottom], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .font(Font.custom("Avenir", size: 15))

                    .padding(.bottom, 5)
                    }
                }
                .padding(.leading, 5)
                }
            
            
            
        }
        .navigationBarHidden(true)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
   
}
