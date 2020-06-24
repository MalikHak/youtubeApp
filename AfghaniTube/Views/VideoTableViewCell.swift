//
//  VideoTableViewCell.swift
//  AfghaniTube
//
//  Created by Faisal Hakim on 6/24/20.
//  Copyright © 2020 Faisal Hakim. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabelView: UILabel!
    @IBOutlet weak var titleLabelView: UILabel!
    @IBOutlet weak var thumbnailImageView:UIImageView!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video){
        
        self.video = v
        
        //Ensure that we have the video
        guard self.video != nil else {
            return
        }
        
        //Set the title
        self.titleLabelView.text = video?.title
        
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabelView.text = df.string(from:video!.published)
        
        //Check if thumnail is not null
    
        guard self.video!.thumbnail != "" else {
            return
        }
        
        
        
        //Check the cache before the downloading
        if let  casheData = CacheManager.getVideoCache(self.video!.thumbnail ) {
        
            
            //set the data
            
            self.thumbnailImageView.image = UIImage(data: casheData)
            return
            
        }
        
        
        
        
        
        //Download the thumbnail data
        
        let url = URL(string: self.video!.thumbnail)
        
        
        //Get the shared url session object
        
        let session = URLSession.shared
        
        
        //Create dat task
        
        let dataTask = session.dataTask(with: url!)
        {(data , response, error) in
            
            if error == nil  && data != nil {
                
                //Save data inside the Cache
                
                CacheManager.setVideoCache(url!.absoluteString, data )
                
                
                //Check if the thumbnail and the downloaded url has the same video thumbnail url
                
                
                if url?.absoluteString != self.video?.thumbnail{
                    
                    return
                }
                
                //Create Image Object
                
                let image = UIImage(data: data!)
                
                //Set The ImageView
                
                DispatchQueue.main.async {

                    self.thumbnailImageView.image = image

                }
                
            }
            
            
        }
   
            
        dataTask.resume()
        
        

        
        
    }
    
}


