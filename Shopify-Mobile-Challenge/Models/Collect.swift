//
//  Collect.swift
//  Shopify-Mobile-Challenge
//
//  Created by Elmer Astudillo on 3/24/19.
//  Copyright © 2019 Elmer Astudillo. All rights reserved.
//

import Foundation

struct Collect {
    var productID : Int
    
    init(productID : Int){
        self.productID = productID
    }
}

extension Collect: Decodable{
    enum keys: String, CodingKey{
        case productID = "product_id"
    }
    
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        let productID = try container.decodeIfPresent(Int.self, forKey: .productID)
        
        self.init(productID: productID ?? 0)
    }
}

struct Collects : Decodable{
    let collects : [Collect]
}




