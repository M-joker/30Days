//
//  ViewController.swift
//  pullToRefresh
//
//  Created by 章敏杰 on 16/3/1.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let cellIdentfiler = "NewCellIdentfiler"
    let aEmoji = ["🏃🏻🏃🏻🏃🏻","💩💩💩","😳😳😳"]
    let bEmoji = ["😯😯😯","😂😂😂","😆😆😆","😈😈😈"]
    
    var Data = [String]()
    var tableviewContronller = UITableViewController(style: .Plain)
    var refreshControl = UIRefreshControl()
    var navBar:UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 64))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Data = aEmoji
        let emojiTableview = tableviewContronller.tableView
        
        emojiTableview.backgroundColor = UIColor(red: 0.092, green: 0.095, blue: 0.016, alpha: 1)
        emojiTableview.dataSource = self
        emojiTableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentfiler)
        
        tableviewContronller.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: "didRoadEmoji", forControlEvents: .ValueChanged)
        self.refreshControl.backgroundColor = UIColor(red: 0.113, green: 0.113, blue: 0.145, alpha: 1)
        let attributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Laat updated on \(NSDate())", attributes: attributes)
        self.refreshControl.tintColor = UIColor.whiteColor()
        self.navBar.barStyle = UIBarStyle.BlackTranslucent
        
        emojiTableview.rowHeight = UITableViewAutomaticDimension
        emojiTableview.estimatedRowHeight = 60.0
        emojiTableview.tableFooterView = UIView(frame: CGRectZero)
        emojiTableview.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.view.addSubview(emojiTableview)
        self.view.addSubview(navBar)
    }
    
    //UItableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentfiler)! as UITableViewCell
        
        cell.textLabel!.text = self.Data[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.Center
        cell.textLabel!.font = UIFont.systemFontOfSize(50)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    //RoadEmoji
    func didRoadEmoji() {
        self.Data = bEmoji
        self.tableviewContronller.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}

