//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Denis O'Brien on 4/27/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            
            GeometryReader { geo in
            TabView {
                
                //Loop through each receipe only show those that should be featured.
                ForEach (0..<model.recipes.count) { index in
                    if model.recipes[index].featured {
                        ZStack{
                    Rectangle()
                                .foregroundColor(.white)
                            VStack(spacing:0){
                                Image(model.recipes[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                
                                Text(model.recipes[index].name)
                                    .padding(5)
                            }
                            
                    }
                        .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y:5)
                    }
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
            VStack(alignment: .leading, spacing:10){
                
                Text("Preparation Time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Preparation Time")

            }
            .padding([.leading,.bottom])
            
        }
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
