//
//  ViewController.swift
//  Login
//
//  Created by 章敏杰 on 16/3/3.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usernameTextField.layer.cornerRadius = 5
        passwordTextFiled.layer.cornerRadius = 5
        login.layer.cornerRadius = 5
        
    }
    @IBOutlet weak var usernamecenter: NSLayoutConstraint!

    @IBOutlet weak var passwordcenter: NSLayoutConstraint!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        usernamecenter.constant -= view.bounds.width
        passwordcenter.constant -= view.bounds.width
        login.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.00, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            
            self.usernamecenter.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.10, options: .CurveEaseOut, animations: {
            
            self.passwordcenter.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.20, options: .CurveEaseOut, animations: {
            
            self.login.alpha = 1
            
            }, completion: nil)
        
    }
    

    
    @IBAction func loginButtonDidTouch(sender: UIButton) {
        let bounds = self.login.bounds
        
        //Animate
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.login.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.login.enabled = false
            
            }, completion: nil)

    }


}

