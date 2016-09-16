//
//  EmtionPackage.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/22.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class EmtionPackage: NSObject {
    var emotions = [Emoticon]()
    
    
    init(id : String) {
        if id == "" {
            return
        }
        
        let plistPath = NSBundle.mainBundle().pathForResource("\(id)/info.plist", ofType: nil, inDirectory: "Emoticons.bundle")
        let arr = NSDictionary(contentsOfFile: plistPath!)!["emoticons"] as! [[String : String]]
        for var dic in arr {
            if let png = dic["png"] {
                //
                dic["png"] = "Other/Emoji/EmotionPackage/" + id + "/" + png
            }
            
            emotions.append(Emoticon(dictionary: dic))
        }
      
    }
}
