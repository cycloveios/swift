//
//  Emoticon.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/22.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class Emoticon: NSObject {
    //emoji的code
    var code : String?{
        didSet{
            guard let code = code else {
                return
            }
            
            let scanner : NSScanner = NSScanner(string: code)
            var value : UInt32 = 0
            scanner.scanHexInt(&value)
            let c = Character(UnicodeScalar(value))
            emojiCode = String(c)
            
        }

        
        
        
    }
    //对应的图片名称
    var png  : String?{
        didSet{
            guard let png = png else {
                return
            }
            pngPath = NSBundle.mainBundle().bundlePath + "/Emoticons.bundle" + png
        }
    }
    //对应的文字
    var chs  : String?
    
    
    
    var pngPath : String?
    var emojiCode : String?
    
    
    
    
    init(dictionary : [String : String]) {
        super.init()
        setValuesForKeysWithDictionary(dictionary)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    override var description: String{
        return dictionaryWithValuesForKeys(["code","chs","png","emojiCode"]).description
    }
}
