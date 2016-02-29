//
//  byCollectionViewCell.swift
//  carousel Effect
//
//  Created by 章敏杰 on 16/2/28.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class byCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var byTitleLabel: UILabel!
    
    var By:by! {
        didSet{
            updateUI()
        }
    }
    
    func updateUI() {
        featuredImageView?.image! = By.featuredImage
        byTitleLabel?.text! = By.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
}
