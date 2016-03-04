//
//  SplasViewController.swift
//  Login
//
//  Created by 章敏杰 on 16/3/4.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class SplasViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loginButton.layer.cornerRadius = 5
        signUpButton.layer.cornerRadius = 5
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
