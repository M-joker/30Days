//
//  NewsTableViewCell.swift
//  sildeMenu
//
//  Created by 章敏杰 on 16/3/7.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var postAuthor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
