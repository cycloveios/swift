//
//  BaseViewController.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/4.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var isLogin = false
    
    
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupVisitorView() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
