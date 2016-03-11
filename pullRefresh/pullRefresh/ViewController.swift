//
//  ViewController.swift
//  pullRefresh
//
//  Created by 章敏杰 on 16/3/8.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tblDemo: UITableView!
    var refreshcontroller : UIRefreshControl!
    var customView : UIView!
    var labelsArray : Array<UILabel> = []
    var isAnimating = false
    var currentColorIndex = 0
    var currentLabelIndex = 0
    var timer: NSTimer!

    var dataArray = ["🍓","🍉","🍐","🍎"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDemo.delegate = self
        tblDemo.dataSource = self
        refreshcontroller = UIRefreshControl()
        refreshcontroller.backgroundColor = UIColor.clearColor()
        refreshcontroller.tintColor = UIColor.clearColor()
        tblDemo.addSubview(refreshcontroller)
        
        loadCustomRefreshContents()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Apple Color Emoji", size: 40)
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
   
    func loadCustomRefreshContents() {
        let refreshContents = NSBundle.mainBundle().loadNibNamed("RefreshContents", owner: self, options: nil) //不清楚的地方
        
        
        customView = refreshContents[0] as! UIView
        customView.frame = refreshcontroller.bounds
        
        for var i = 0; i < customView.subviews.count; ++i {
            
            let s = customView.viewWithTag(i+1) as? UILabel
            
            labelsArray.append(s!)
        }
        
        refreshcontroller.addSubview(customView)
    }

    func animateRefreshStep1() {
        isAnimating = true
        
        UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveLinear, animations: { () -> Void in
            
            self.labelsArray[self.currentLabelIndex].transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
            
            
            }, completion: { (finished) -> Void in
                ++self.currentLabelIndex
               
                if self.currentLabelIndex < self.labelsArray.count {
                    self.animateRefreshStep1()
                }else {
                    self.animateRefreshStep2()
                }
                
        })
        
    }
    
    func animateRefreshStep2(){
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveLinear, animations: { () -> Void in
            
            self.labelsArray[0].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[1].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[2].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[3].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[4].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[5].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[6].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[7].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[8].transform = CGAffineTransformMakeScale(1.5, 1.5)
            
            }, completion: {(finished) -> Void in
                UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveLinear, animations: { () -> Void in
                    
                    self.labelsArray[0].transform = CGAffineTransformIdentity
                    self.labelsArray[1].transform = CGAffineTransformIdentity
                    self.labelsArray[2].transform = CGAffineTransformIdentity
                    self.labelsArray[3].transform = CGAffineTransformIdentity
                    self.labelsArray[4].transform = CGAffineTransformIdentity
                    self.labelsArray[5].transform = CGAffineTransformIdentity
                    self.labelsArray[6].transform = CGAffineTransformIdentity
                    self.labelsArray[7].transform = CGAffineTransformIdentity
                    self.labelsArray[8].transform = CGAffineTransformIdentity
                    
                    }, completion: { (finished) -> Void in
                        
                        if self.refreshcontroller.refreshing {
                            self.currentLabelIndex = 0
                            self.animateRefreshStep1()
                        }
                        else {
                            self.isAnimating = false
                            self.currentLabelIndex = 0
                            for var i=0; i<self.labelsArray.count; ++i {
                                self.labelsArray[i].textColor = UIColor.blackColor()
                                self.labelsArray[i].transform = CGAffineTransformIdentity
                            }
                        }
                        
                })
        })
    }
    
    func getNextColor() -> UIColor {
        var colorsArray: Array<UIColor> = [UIColor.magentaColor(), UIColor.brownColor(), UIColor.yellowColor(), UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor(), UIColor.orangeColor()]
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0
        }
        
        ++currentColorIndex
        let returenColor = colorsArray[currentColorIndex]
        
        return returenColor
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if refreshcontroller.refreshing {
            if !isAnimating {
                
                doSomething()
                animateRefreshStep1()
            }
        }
    }

    func doSomething() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "endedOfWork", userInfo: nil, repeats: true)
    }
    
    func endedOfWork() {
        
        refreshcontroller.endRefreshing()
        timer.invalidate()
        timer = nil
    }

}

