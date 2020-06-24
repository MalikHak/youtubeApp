//
//  Model.swift
//  AfghaniTube
//
//  Created by Faisal Hakim on 6/24/20.
//  Copyright © 2020 Faisal Hakim. All rights reserved.
//

import Foundation
protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
}


class Model {
    
    var delegate: ModelDelegate?
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
            //Parsing the data into video Objects
            do{
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
  
             //Call the videoFetched  method  of delegate
                if response.items != nil{
                    
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items! )
                    }

                }
                
             //   dump(response)
            }catch{ 
                
            }
        }
        //Kick of the task
        dataTask.resume()
        

    
    }
    
    
}
