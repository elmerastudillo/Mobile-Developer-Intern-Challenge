//
//  Product.swift
//  Shopify-Mobile-Challenge
//
//  Created by Elmer Astudillo on 3/24/19.
//  Copyright © 2019 Elmer Astudillo. All rights reserved.
//

import Foundation

struct Variant{
    var inventoryQuanity: Int
    
    init(inventoryQuanity: Int) {
        self.inventoryQuanity = inventoryQuanity
    }
}

extension Variant: Decodable{
    enum keys: String, CodingKey{
        case inventoryQuanity = "inventory_quantity"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        let inventoryQuantity = try container.decodeIfPresent(Int.self, forKey: .inventoryQuanity)
        
        self.init(inventoryQuanity: inventoryQuantity ?? 0)
    }
    
}

struct Product{
    var title : String
    var inventory: Int
    var vendor: String
    var imageURL : String
    
    init(title: String, inventory: Int, vendor: String, imageURL: String) {
        self.title = title
        self.inventory = inventory
        self.vendor = vendor
        self.imageURL = imageURL
    }
}

extension Product: Decodable{
    enum keys: String, CodingKey{
        case title
        case vendor
        case image
        case variants
    }
    
    enum nestedImageKey: String, CodingKey{
        case src
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        let title = try container.decodeIfPresent(String.self, forKey: .title)
        let vendor = try container.decodeIfPresent(String.self, forKey: .vendor)
        let imageContainer = try container.nestedContainer(keyedBy: nestedImageKey.self, forKey: .image)
        let imageURL = try imageContainer.decodeIfPresent(String.self, forKey: .src)
        let variants = try container.decodeIfPresent([Variant].self, forKey: .variants)
        
        var total = 0
        
        if let newVariants = variants{
            for variant in newVariants{
                total += variant.inventoryQuanity
            }
        }
        
        self.init(title: title ?? "none", inventory: total, vendor: vendor ?? "none", imageURL: imageURL ?? "none")
    }
}

struct Products : Decodable {
    let products : [Product]
}
