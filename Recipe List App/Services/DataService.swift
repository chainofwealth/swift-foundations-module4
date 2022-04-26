//
//  DataService.swift
//  Recipe List App
//
//  Created by Denis O'Brien on 4/25/22.
//

import Foundation

class DataService {
    
   static func getLocalData() -> [Recipe] {

        //parse the local json file

        //Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")

        //Check if pathString is not nil, otherwise..
        guard pathString != nil else{
            return [Recipe]()
        }
        
        //Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        
        
        do {
            
            let data = try Data(contentsOf: url)
            
            //Decode the json with a JSON decoder
            let decoder = JSONDecoder()
        
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //Add unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                //Return the recipes
                return recipeData
                
                
            } catch {
                //error with decoding json
                print(error)
            }
            
            
        } catch {
            //error with gettign data
            print(error)
            
        }
        return [Recipe]()

        
        
        
    }
}
