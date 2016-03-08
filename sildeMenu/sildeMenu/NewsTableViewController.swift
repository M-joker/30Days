//
//  NewsTableViewController.swift
//  sildeMenu
//
//  Created by 章敏杰 on 16/3/7.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = " Moments"
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.backgroundColor = UIColor(red: 0.062, green: 0.062, blue: 0.07, alpha: 1)
    }
    
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsTableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        
        if indexPath.row == 0 {
            cell.postImage.image = UIImage(named: "1")
            cell.postTitle.text = "Love Mountain"
            cell.postAuthor.text = "ZhangMinjie"
            cell.authorImage.image = UIImage(named: "a")
        }else if indexPath.row == 1 {
            cell.postImage.image = UIImage(named: "2")
            cell.postTitle.text = "New graphic design - LIVE FREE"
            cell.postAuthor.text = "annie"
            cell.authorImage.image = UIImage(named: "b")
        }else if indexPath.row == 2{
            cell.postImage.image = UIImage(named: "3")
            cell.postTitle.text = "Summer sand"
            cell.postAuthor.text = "Andrew"
            cell.authorImage.image = UIImage(named: "c")
        }else if indexPath.row == 3{
            cell.postImage.image = UIImage(named: "4")
            cell.postTitle.text = "Seeking for signal"
            cell.postAuthor.text = "Sam"
            cell.authorImage.image = UIImage(named: "d")
        }else {
            cell.postImage.image = UIImage(named: "5")
            cell.postTitle.text = "I don't Know what's this"
            cell.postAuthor.text = "I don't Know who is she"
            cell.authorImage.image = UIImage(named: "e")
        }
        
        return cell
    }
}
