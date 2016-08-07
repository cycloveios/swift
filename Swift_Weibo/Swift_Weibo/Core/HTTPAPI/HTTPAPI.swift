//
//  HTTPAPI.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/5.
//  Copyright © 2016年 cyc. All rights reserved.
//
import AFNetworking
enum RequestMethod : String{
    case GET = "GET"
    case POST = "POST"
}


class HTTPAPI: AFHTTPSessionManager {
    //单例 let是线程安全的
    static let shareAPI : HTTPAPI = {
        let api = HTTPAPI()
        api.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return api
    }()

    
    
    
    func request(method : RequestMethod, URLString : String, parameters : AnyObject?, finished :((result : AnyObject?, error : NSError?) -> Void)?){
        
        let success : ((dataTask : NSURLSessionDataTask, error : AnyObject?) -> ())? = {(dataTask : NSURLSessionDataTask, data : AnyObject?) in
            finished!(result: data, error: nil)
        }
        let failure : ((dataTask : NSURLSessionDataTask?, error : NSError) -> ())? = {(dataTask : NSURLSessionDataTask?, error : NSError) in
            finished!(result: nil, error: error)
        }
        let progress : ((progress : NSProgress) -> Void)? = {(progress : NSProgress) in
            print(progress)
        }
        
        
        if method == .GET {
            GET(URLString, parameters: parameters, progress: progress, success: success, failure: failure)
        }else {
            POST(URLString, parameters: parameters, progress: progress, success: success, failure: failure)
        }

    }
    
    
    
    
}

extension HTTPAPI{
    
    ///请求访问令牌
    func loadAccessToken(code : String, finished : ((result : AnyObject?, error : NSError?) -> Void)?)  {
        let parameters = ["client_id" : WEIBO_KEY, "client_secret" : WEIBO_SERCET, "grant_type" : "authorization_code", "code" : code, "redirect_uri" : WEIBO_REDIRECT]
        request(.POST, URLString: WEIBO_URL_ACCESS_TOKEN, parameters: parameters) { (result, error) in
            guard finished != nil else {
                return
            }
            guard  error == nil else {
                finished!(result: nil,error: error!)
                return
            }
            finished!(result: result!, error: nil)
            
        }
    }
    
    ///获取用户基本信息
    func loadUserInfo(accessToken : String, uid : String, finished : ((result : AnyObject? , error : NSError?) -> Void)?){
        let parameters = ["access_token" : accessToken, "uid" : uid]
        
        request(.GET, URLString: WEIBO_URL_USER, parameters: parameters) { (result, error) in
          
            guard finished != nil else{
                return
            }
            guard error != nil else{
                finished!(result: result, error: error)
                return
            }
            finished!(result: result,error: nil)
 
        }
    }
    
    
    
    
    
    
    
    
}