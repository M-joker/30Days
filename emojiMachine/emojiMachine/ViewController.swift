//
//  ViewController.swift
//  emojiMachine
//
//  Created by 章敏杰 on 16/3/7.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var emjioPickerView: UIPickerView!
    @IBOutlet weak var goButton: UIButton!
    @IBAction func goButtonDidTouch(sender: AnyObject) {
        emjioPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 0, animated: true)
        emjioPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 1, animated: true)
        emjioPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 2, animated: true)
        
        if (dataArray1[emjioPickerView.selectedRowInComponent(0)] == dataArray2[emjioPickerView.selectedRowInComponent(1)] && dataArray2[emjioPickerView.selectedRowInComponent(1)] ==
            dataArray3[emjioPickerView.selectedRowInComponent(2)]) {
                
            resultLabel.text = "Bingo"
        }else {
            resultLabel.text = "😨😨😨"
        }
        
        //animate
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .CurveLinear, animations: {
            
            self.goButton.bounds = CGRect(x: self.goButton.bounds.origin.x, y: self.goButton.bounds.origin.y, width: self.goButton.bounds.size.width, height: self.goButton.bounds.size.height)
            
            }, completion: { (compelete: Bool) in
                UIView.animateWithDuration(0.5, delay: 0.1, options: .CurveEaseInOut, animations: {
                    self.goButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
                    }, completion: nil)
                
        })
        
    }
    @IBOutlet weak var resultLabel: UILabel!
    
    var ImageArray = [""]
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var bounds:CGRect = CGRectZero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bounds = goButton.bounds
        ImageArray = ["😍","🌺","🌞","🍐","🍚","🎃","♣️","🇨🇳","👑","👻","🍔","🐷"]
        
        for (var i = 0; i < 100 ; i++) {
        dataArray1.append((Int)(arc4random() % 10))
        dataArray2.append((Int)(arc4random() % 10))
        dataArray3.append((Int)(arc4random() % 10))
            
        }
        
        resultLabel.text = ""
        
        emjioPickerView.dataSource = self
        emjioPickerView.delegate = self
        
        goButton.layer.cornerRadius = 24
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        goButton.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.1, options: .CurveEaseOut, animations: {
                self.goButton.alpha = 1
            }, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        
        if component == 0 {
            pickerLabel.text = ImageArray[(Int)(dataArray1[row])]
        }else if component == 1 {
            pickerLabel.text = ImageArray[(Int)(dataArray2[row])]
        }
        else{
            pickerLabel.text = ImageArray[(Int)(dataArray3[row])]
        }
            
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.Center
            
        
        return pickerLabel
    }

}

