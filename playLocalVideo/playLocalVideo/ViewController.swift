//
//  ViewController.swift
//  playLocalVideo
//
//  Created by 章敏杰 on 16/2/25.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var videoTableView: UITableView!
    
    var data = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    
    var playViewController = AVPlayerViewController()
    var playerview = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func playVideoButtonDidTouch(sender: AnyObject) {
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        playerview = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        
        playViewController.player = playerview
        
        self.presentViewController(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as! VideoCell
        let video = data[indexPath.row]
        
        cell.videoscreenshot.image = UIImage(named: video.image)
        cell.videosourcelabel.text = video.source
        cell.videotitlelabel.text = video.title
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

