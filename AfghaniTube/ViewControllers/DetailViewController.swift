//
//  DetailViewController.swift
//  AfghaniTube
//
//  Created by Faisal Hakim on 6/24/20.
//  Copyright © 2020 Faisal Hakim. All rights reserved.
//

import UIKit
import WebKit
class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Clear the fields
    
        
        titleLabel.text = ""
        dateLabel.text  = ""
        textView.text = ""
        
        
        //Check if there is a video
        guard video != nil else{
            
            return
        }
        
        
        //Create embedUrl
        let embedURLStrinng = Constatns.YT_EMBED_URL + video!.videId
        
        
        //Load into the webView
        
        let url = URL(string: embedURLStrinng )
        let request = URLRequest(url: url!)
        webView.load(request)
        //Set the title
        titleLabel.text = video!.title
        
        //Set the date
        let df = DateFormatter()
          df.dateFormat = "EEEE, MMM d, yyyy"
        
        dateLabel.text = df.string(from: video!.published)
        
        
        //Set the description
        
        textView.text = video! .description
        
        
        
        
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
