//
//  ViewController.swift
//  AfghaniTube
//
//  Created by Faisal Hakim on 6/22/20.
//  Copyright © 2020 Faisal Hakim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate, ModelDelegate {

    

    var videos = [Video]()

    @IBOutlet weak var uiTableView: UITableView!
    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        uiTableView.dataSource = self
        uiTableView.delegate = self
        
        
        //set itself as the delegate of the model
        
        model.delegate = self
        
        model.getVideos()

    }
    
    
    
    func videosFetched(_ videos: [Video]) {

        
        //set the returned videos to our videos property
        
        self.videos = videos
        
         //Refresh the table View
        
        uiTableView.reloadData()
        
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: Constatns.VIDEO_ID, for: indexPath)
        
        
        //Configure the cell with the data
        // Get the title for the video in question
        
        let title = self.videos [indexPath.row].title
        
        cell.textLabel?.text = title
        
        
        //Return the cell
        return cell 
    
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}

