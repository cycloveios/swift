//
//  UserAccount.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/6.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class UserAccount: BaseModel {
    //授权accesstoken
    var access_token : String?
    //过期时间
    var expires_in : NSTimeInterval = 0.0
    
    var uid : String?

    init(dic : [String : AnyObject]) {
        super.init()
        self.setValuesForKeysWithDictionary(dic)
        
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }


}

class User: BaseModel {
    
    static let shareUser : User = User()
    
    var sex : String?
    var nickname : String?
    var city : String?
    var country : String?
    var language : String?
    var headimgurl : String?
    var headimgurl_large : String?
    var headimgurl_hd : String?
    var subscribe_time : String?
   
    
    
    var subscribe = 0
    var uid = 0
    var province = 0
    var follow = 0

    override init() {
        super.init()
    }
    
    init(dic : [String : AnyObject]) {
        User.shareUser.setValuesForKeysWithDictionary(dic)
        
    }
    
    override func setValuesForKeysWithDictionary(keyedValues: [String : AnyObject]) {
    }
    
    override var description: String{
        return dictionaryWithValuesForKeys(["country","nickname","headimgurl"]).description
    }
}
