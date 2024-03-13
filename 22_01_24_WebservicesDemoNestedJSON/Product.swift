//
//  Product.swift
//  22_01_24_WebservicesDemoNestedJSON
//
//  Created by Vishal Jagtap on 13/03/24.
//

import Foundation
struct Product{
    var id : Int
    var title : String
    var price : Double
    var description : String
    var category : String
    var image : String
    var rating : Rating
}

struct Rating{
    var rate : Double
    var count : Int
}
