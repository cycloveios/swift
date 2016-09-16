//
//  EmotionManager.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/22.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class EmotionManager : NSObject{
    var packages : [EmtionPackage] = [EmtionPackage]()
    
    override init() {
        super.init()
        let ids = ["", "com.apple.emoji", "com.sina.default", "com.sina.lxh"]
        
        for id in ids {
            packages.append(EmtionPackage(id: id))
        }
        
    }
    
}
