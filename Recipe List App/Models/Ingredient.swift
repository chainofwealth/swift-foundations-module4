//
//  Ingredient.swift
//  Recipe List App
//
//  Created by Denis O'Brien on 4/27/22.
//

import Foundation

class Ingredient: Identifiable, Decodable{
    var id:UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
}
