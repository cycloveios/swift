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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }


}

class User: BaseModel {
    
    static let shareUser : User = User()
    
    var uid : String?
    var city : Int = 0
    var province : Int = 0
    var followers_count : Int = 0
    var friends_count : Int = 0
    var statuses_count : Int = 0
    var favourites_count : Int = 0
    var online_status : Int = 0
    var bi_followers_count : Int = 0
    
    
    
    
    
    var idstr : String?
    var screen_name : String?
    var name : String?
    var location : String?
    var userdescription : String?
    var url : String?
    var profile_image_url : String?
    var profile_url : String?
    var domain : String?
    var weihao : String?
    var gender : String?
    var avatar_large : String?
    var avatar_hd : String?
    var follow_me : String?

    
    
   override init(){
        super.init()
    }
    
    init(dic : [String : AnyObject]) {
        super.init()
        User.shareUser.setValuesForKeysWithDictionary(dic)
        
    }
    
    //归档
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
        uid = aDecoder.decodeObjectForKey("uid") as? String
        
    }
    //解归档
    override func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(uid, forKey: "uid")
        
    }
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        if key == "id" {
            uid = value as? String
        }
        if key == "description" {
            userdescription = value as? String
        }
        
    }
    
    override var description: String{
        return dictionaryWithValuesForKeys(["country","nickname","headimgurl"]).description
    }
}
