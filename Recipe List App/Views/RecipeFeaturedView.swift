//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Denis O'Brien on 4/27/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 24))
            
            
            GeometryReader { geo in
//                MARK - Featured tab
                TabView (selection: $tabSelectionIndex) {
                    
                    //Loop through each receipe only show those that should be featured.
                    ForEach (0..<model.recipes.count) { index in
                        if model.recipes[index].featured {
                            //Recipe card button
                            Button {
                                self.isDetailViewShowing = true                            } label: {
                                    ZStack{
                                        Rectangle()
                                            .foregroundColor(.white)
                                        VStack(spacing:0){
                                            Image(model.recipes[index].image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .clipped()
                                            
                                            Text(model.recipes[index].name)
                                                .font(Font.custom("Avenir", size: 15))
                                                .padding(5)
                                        }
                                        
                                    }
                                }
                                .tag(index)
                                .sheet(isPresented: $isDetailViewShowing){
                                    RecipeDetailView(recipe:model.recipes[index])
                                    
                                }
                                .buttonStyle(PlainButtonStyle())
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
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                
            }
            .padding([.leading,.bottom])
            
        }
        .onAppear {
            setFeaturedIndex()
        }
        
    }
    
    func setFeaturedIndex() {
        //fint the first recipe that is featured.
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
    
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
