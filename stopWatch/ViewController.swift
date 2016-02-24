//
//  ViewController.swift
//  stopWatch
//
//  Created by 章敏杰 on 16/2/24.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var Counter = 0.0 //是double类型的，Int类型没有小数点后的位数
    var Timer = NSTimer()
    var IsPlaying = false
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBAction func resetButtonDidTouch(sender: AnyObject) {
        Timer.invalidate()
        IsPlaying = false
        Counter = 0
        timeLabel.text = String(Counter)
    }
    @IBAction func playButtonDidTouch(sender: AnyObject) {
        if(IsPlaying) {
            return
        }
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("UpdateTimer"), userInfo: nil, repeats: true)
        IsPlaying = true
        
    }
    
    @IBAction func pauseButtonDidTouch(sender: AnyObject) {
        Timer.invalidate()
        IsPlaying = false
    }
    
    func UpdateTimer() {
        Counter = Counter + 0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(Counter)
        // Do any additional setup after loading the view, typically from a nib.
    }

    

}

