//
//  Collection.swift
//  Shopify-Mobile-Challenge
//
//  Created by Elmer Astudillo on 3/22/19.
//  Copyright © 2019 Elmer Astudillo. All rights reserved.
//

import Foundation

struct Collection {
    var id : Int
    var title : String
    var imageString: String
    var body: String
    
    init(title: String, body: String, imageString: String, id: Int){
        self.title = title
        self.imageString = imageString
        self.id = id
        self.body = body
    }
}

extension Collection: Decodable{
    enum keys: String, CodingKey{
        case id
        case title
        case image
        case body = "body_html"
    }
    
    enum nestedKeys: String, CodingKey{
        case src
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        let id = try container.decodeIfPresent(Int.self, forKey: .id)
        let title = try container.decodeIfPresent(String.self, forKey: .title)
        let body = try container.decodeIfPresent(String.self, forKey: .body)
        let nestedContainer = try container.nestedContainer(keyedBy: nestedKeys.self, forKey: .image)
        let image = try nestedContainer.decodeIfPresent(String.self, forKey: .src)
        
        self.init(title: title ?? "",body: body ?? "" , imageString: image ?? "", id: id ?? 0)
    }
}

struct Collections: Decodable {
    let custom_collections : [Collection]
}
