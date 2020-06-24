//
//  Video.swift
//  AfghaniTube
//
//  Created by Faisal Hakim on 6/24/20.
//  Copyright © 2020 Faisal Hakim. All rights reserved.
//

import Foundation

struct Video: Decodable {

    
    var videId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date( )
    
    enum Codingkeys: String, CodingKey {
    
        case snippet
        case thumbnails
        case high
        case resourceId
        
        
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init(from decoder : Decoder) throws {

        //This will Parse all container
        let container = try decoder.container(keyedBy: Codingkeys.self)

        //This will Parse the snippet containner
        let snippetContainner = try container.nestedContainer(keyedBy:Codingkeys.self, forKey: .snippet )

        // Parse Title
        
        self.title = try snippetContainner.decode(String.self, forKey: .title )
        
        // Parse Description
        self.description = try snippetContainner.decode(String.self, forKey: .description  )

        
        // Parse Publish Date
        
        self.published = try snippetContainner.decode(Date.self, forKey: .published)
    
        //Parse Thumbnails
        
        let thumbnailContainer = try snippetContainner.nestedContainer(keyedBy: Codingkeys.self, forKey: .thumbnails)
    
        //Parse highReslougtion
    
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: Codingkeys.self, forKey: .high)
    
        //Parse Thumbnail Url
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        
        
        //Parse resouceId
        let resourIdContainner = try snippetContainner.nestedContainer(keyedBy: Codingkeys.self, forKey: .resourceId)
        
        self.videId = try resourIdContainner.decode(String.self, forKey: .videoId)
        
        
        
    }

    
}
