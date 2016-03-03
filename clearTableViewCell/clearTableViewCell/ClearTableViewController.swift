//
//  ViewController.swift
//  clearTableViewCell
//
//  Created by 章敏杰 on 16/3/3.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class ClearTableViewController: UITableViewController {
    
    var Data = ["盼我疯魔还盼我孑孓不独活","想我冷艳还想我轻佻又下贱","要我阳光还要我风情不摇晃","戏我哭笑无主还戏我心如枯木","赐我梦境还赐我很快就清醒","与我沉睡还与我蹉跎无慈悲","爱我纯粹还爱我赤裸不靡颓","看我自弹自唱还看我痛心断肠","愿我如烟还愿我曼丽又懒倦","看我痴狂还看我风趣又端庄","要我美艳还要我杀人不眨眼","要我美艳还要我杀人不眨眼","祝我从此幸福还祝我枯萎不渡","为我撩人还未我双眸失神","图我情真还图我眼波销魂","与我私奔还与我做不二臣","夸我含苞待放还夸我欲盖弥彰"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.sharedApplication().statusBarHidden = true
        
        self.view.backgroundColor = UIColor.blackColor()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.tableFooterView = UIView(frame:CGRectZero)
        self.tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "tableCell")
    }

   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = Data[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func colorforIndex(index: Int) -> UIColor {
        let itemCount = Data.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.5, alpha: 1.0)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.backgroundColor = colorforIndex(indexPath.row)
    }

}

