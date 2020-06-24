//
//  Model.swift
//  AfghaniTube
//
//  Created by Faisal Hakim on 6/24/20.
//  Copyright © 2020 Faisal Hakim. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
   
//Create url Object
        let url = URL(string: Constatns.API_URL)

        guard url != nil else {
            return
        }

        //Get a URL Session Object
        let session = URLSession.shared
        
        //Get a task from the url session object
        let dataTask = session.dataTask(with: url!){(data,resoponse,error) in
           
            //Check for the error
            if error != nil || data == nil{
                return
            }
            
            //Parsing the data into viewObjects
            
            
        }
        //Kick of the task
        dataTask.resume()
        

    
    }
    
    
}
