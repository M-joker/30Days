//
//  by.swift
//  carousel Effect
//
//  Created by 章敏杰 on 16/2/28.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class by {
    // MARK: Public API
    var title = ""
    var description = ""
    var featuredImage: UIImage!
    
    init(title:String,description:String,featuredImage:UIImage!) {
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
    }
    
    // MARK: - Private
    
    static func BY() -> [by] {
        return [
            by(title: "It's me! ", description: " I'm a small公举! 23333 ", featuredImage: UIImage(named: "我")!),
            by(title: "VICTORIA'S SECRET", description: "......", featuredImage:UIImage(named: "维多利亚的秘密")!),
            by(title: "He is my one of best friends", description: "He is very strong ", featuredImage: UIImage(named: "胖胖")!),
            by(title: "NanJINGlu", description: "ShangHai's most famous street", featuredImage: UIImage(named: "南京路")!),
            by(title: "Its name is Lele", description: "Lele is not happy", featuredImage: UIImage(named: "乐乐")!),
            by(title: "I was see the first Snow in my hometown:ShangYu", description: "It was happend in night", featuredImage: UIImage(named: "第一场雪")!),
            
        ]
    }

}
