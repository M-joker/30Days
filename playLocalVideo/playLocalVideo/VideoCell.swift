//
//  videoCell.swift
//  playLocalVideo
//
//  Created by 章敏杰 on 16/2/26.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

struct video {
    let image:String
    let title:String
    let source:String
}

class VideoCell: UITableViewCell {
    @IBOutlet weak var videoscreenshot: UIImageView!
    @IBOutlet weak var videotitlelabel: UILabel!
    @IBOutlet weak var videosourcelabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

