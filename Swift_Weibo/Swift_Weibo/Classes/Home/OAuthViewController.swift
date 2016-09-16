//
//  OAuthViewController.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/6.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuthViewController: BaseViewController {

    @IBOutlet weak var oauthView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        loadPage()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
extension OAuthViewController{
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: #selector(OAuthViewController.closeItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: .Plain, target: self, action: #selector(OAuthViewController.fillItemClick))
    }
    
    func loadPage() {
        let url =
        NSURL(string: "https://api.weibo.com/oauth2/authorize?client_id=\(WEIBO_KEY)&redirect_uri=\(WEIBO_REDIRECT)")
        guard url != nil else{
            return
        }
        
        oauthView.loadRequest(NSURLRequest(URL: url!))
    }
}

extension OAuthViewController{
    @objc private func closeItemClick() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @objc private func fillItemClick() {
        let jsCode = "document.getElementById('userId').value='13821506950';document.getElementById('passwd').value='16654221a'"
        oauthView.stringByEvaluatingJavaScriptFromString(jsCode)
        
    }
    
    private func loadAccessToken(code : String){
        HTTPAPI.shareAPI.loadAccessToken(code) {  (data, error) in
            if error != nil{
                return
            }
            guard data != nil else{
                return
            }
            let accountDic = data as! [String : AnyObject]
            print(accountDic)
            
            let account = UserAccount(dic: accountDic)
            print(account.uid)
            
            self.loadUserInfo(account.access_token, uid: account.uid)
        }
    }
    
    private func loadUserInfo(access_token : String?, uid : String?){
        
        print(access_token! + uid!)
        HTTPAPI.shareAPI.loadUserInfo(access_token!, uid: uid!) { (result, error) in
            let user = User.init(dic: (result as! [String: AnyObject]))
            
        }
    }
  
}


// MARK:-  代理
extension OAuthViewController : UIWebViewDelegate{
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        SVProgressHUD.dismiss()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        
        guard let url = request.URL else{
            return true
        }
        let urlStr = url.absoluteString
        guard urlStr.containsString("code=") else{
            return true
        }
        print(urlStr)
        
        let arr : [String] =  urlStr.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: "&?"))
        print(arr)
        let code = (arr[1] as NSString).substringFromIndex(5)
        print(code)
        
        loadAccessToken(code)
        
        
        return false
    }
    
    
}
