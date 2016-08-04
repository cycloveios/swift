//
//  BaseTableViewController.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/4.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    var isLogin = false
    
    lazy var visitorView = VisitorView.visitorView()
    
    
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
}
// MARK:- UI
extension BaseTableViewController{
    private func setupVisitorView(){
        self.view = visitorView
    }
    
    private func setupNavigationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: "registerBtnClick")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: "loginBtnClick")
        
    }
}

// MARK:- 事件监听
extension BaseTableViewController{
    @objc private func registerBtnClick(){
        
    }
    
    @objc private func loginBtnClick(){
        
    }
    
}