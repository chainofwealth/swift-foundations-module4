//
//  ContentView.swift
//  Recipe List App
//
//  Created by Denis O'Brien on 4/25/22.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        NavigationView(){
            
            VStack(alignment:.leading){
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                ScrollView{
                    LazyVStack(alignment:.leading){
                        ForEach (model.recipes){ r in
                            NavigationLink {
                                RecipeDetailView(recipe: r)
                                
                            } label: {
                                //MARK - Row Item
                                HStack(spacing: 20.0) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack(alignment:.leading){
                                    Text(r.name)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                            .foregroundColor(.black)
                                        
                                    RecipeHighlights(highlights: r.highlights)
                                    }
                                    .foregroundColor(.black)
                                }
                                
                                
                            }
                        }
                    }
                    
                }
            }
            .navigationBarHidden(true)
            .padding(.leading, 20)
            
        }
    }
    
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
