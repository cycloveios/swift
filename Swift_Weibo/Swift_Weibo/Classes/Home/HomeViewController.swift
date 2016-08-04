//
//  HomeViewController.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/4.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class HomeViewController: BaseTableViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()

        isLogin = true
        
        if isLogin {
            setupNavigationBar()
        }
        
        
        
        
        visitorView.addRotationAnimation()
        visitorView.loginBlock = {
            print("login")
        }
        visitorView.registerBlock = {
            print("register")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */



}


// MARK:- UI设置
extension HomeViewController{
    private func setupNavigationBar(){
        
        //左边的barbtnitem
        let leftbtn = UIButton()
        leftbtn.setImage(UIImage(named: "navigationbar_friendattention"), forState: .Normal)
        leftbtn.setImage(UIImage(named: "navigationbar_friendattention_highlighted"), forState: .Highlighted)
        leftbtn.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftbtn)
        leftbtn.tag = 1001
        leftbtn.sizeToFit()

        //右边的barbrnitem
        let rightbtn = UIButton()
        rightbtn.tag = 1002
        rightbtn.setImage(UIImage(named: "navigationbar_pop"), forState: .Normal)
        rightbtn.setImage(UIImage(named: "navigationbar_pop_highlighted"), forState: .Highlighted)
        rightbtn.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightbtn)
        rightbtn.sizeToFit()
    }

}

// MARK:- 功能

extension HomeViewController{
    @objc private func btnClick(btn : UIButton){
        if btn.tag == 1001{
            
        }else if btn.tag == 1002{
            let scanningVC = ScanningViewController()
            
            navigationController?.pushViewController(scanningVC, animated: true)
        }
    }
}

