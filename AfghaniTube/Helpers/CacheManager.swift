//
//  CacheManager.swift
//  AfghaniTube
//
//  Created by Faisal Hakim on 6/24/20.
//  Copyright © 2020 Faisal Hakim. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
   
    
    static func setVideoCache (_ url:String, _ data:Data?){
        
        
        //Store the image data and use url as  the key
        cache[url] = data
        
    }
    
    static func getVideoCache (_ url:String )-> Data? {
        
        return cache[url]
    }
    
}
