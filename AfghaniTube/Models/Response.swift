//
//  Response.swift
//  AfghaniTube
//
//  Created by Faisal Hakim on 6/24/20.
//  Copyright © 2020 Faisal Hakim. All rights reserved.
//

import Foundation

struct Response: Decodable {

     
    var items : [Video]?

    
    enum CodingKeys: String, CodingKey {
        case items
        
    }
    
    
    init(from decoder:Decoder) throws  {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
        
        
    }
}
