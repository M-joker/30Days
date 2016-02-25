//
//  ViewController.swift
//  CustomFont
//
//  Created by 章敏杰 on 16/2/25.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var data = ["是否很惊讶 讲不出说话","没错我是说 你想分手吗","曾给你驯服到 就像绵羊","何解会反咬你一下 你知吗"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular","Gaspar Regular"]
    
    var fontIndex = 0
    
    @IBOutlet weak var changeFontButton: UIButton!
    @IBOutlet weak var fontTableView: UITableView!
    @IBAction func changeFontDidTouch(sender: AnyObject) {
        
        fontIndex = (fontIndex + 1) % 4
        fontTableView.reloadData()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontTableView.delegate = self
        fontTableView.dataSource = self
        
        for family in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(family) {
                print(font)
            }
           
        }
         changeFontButton.layer.cornerRadius  = 55
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCellWithIdentifier("FontCell", forIndexPath: indexPath)
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name: self.fontNames[fontIndex], size: 16)
//        cell.textLabel?.font = UIFont.systemFontOfSize(16)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}

