//
//  HomeViewController.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/4.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class HomeViewController: BaseTableViewController {
    lazy var leftbtn = UIButton()
    lazy var rightbtn = UIButton()
    lazy var titleView = TitleView(frame: CGRectZero)
    lazy var grayView = UIView(frame: UIScreen.mainScreen().bounds)
    
    lazy var popverAnimator : PopoverAnimator = PopoverAnimator {[weak self] (presented : Bool) in
        self?.titleView.selected = presented
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    
        grayView.backgroundColor = UIColor.grayColor()

        
        
        visitorView.addRotationAnimation()
        visitorView.loginBlock = {
            let oauthVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewControllerWithIdentifier("oauthVC")
          self.navigationController?.pushViewController(oauthVC, animated: true)
            
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


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }




}


// MARK:- UI设置
extension HomeViewController{
    private func setupNavigationBar(){
        
        //左边的barbtnitem
      
        leftbtn.setImage(UIImage(named: "navigationbar_friendattention"), forState: .Normal)
        leftbtn.setImage(UIImage(named: "navigationbar_friendattention_highlighted"), forState: .Highlighted)
        leftbtn.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftbtn)
        leftbtn.tag = 1001
        leftbtn.sizeToFit()

        //右边的barbrnitem
     
        rightbtn.tag = 1002
        rightbtn.setImage(UIImage(named: "navigationbar_pop"), forState: .Normal)
        rightbtn.setImage(UIImage(named: "navigationbar_pop_highlighted"), forState: .Highlighted)
        rightbtn.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightbtn)
        rightbtn.sizeToFit()
        
        
   
        titleView.setTitle("cyc", forState:.Normal)
        titleView.addTarget(self, action: "titleViewClick:", forControlEvents: .TouchUpInside)
        navigationItem.titleView = titleView
        titleView.sizeToFit()
        
    }

}

// MARK:- 功能

extension HomeViewController{
    @objc private func btnClick(btn : UIButton){
        if btn.tag == 1001{
            
        }else if btn.tag == 1002{
            let scanningVC = ScanningViewController()
            
//            navigationController?.pushViewController(scanningVC, animated: true)
            self.presentViewController(scanningVC, animated: true, completion: {
                
            })
        }
    }
    @objc private func titleViewClick(btn : UIButton){
        let isSelect = btn.selected
        btn.selected = !isSelect
        let popoverVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewControllerWithIdentifier("popoverVC")
        

        popoverVC.view.backgroundColor = UIColor.whiteColor()
        //保证在model视图弹出的时候 之前的controller不会被移除
        popoverVC.modalPresentationStyle = .Custom
        
        //设置转场代理，可以用于改变弹出视图的大小
        popoverVC.transitioningDelegate = popverAnimator
        let titleView_W : CGFloat = 200.0

        popverAnimator.presenetedFrame = CGRectMake(UIScreen.mainScreen().bounds.size.width * 0.5 - titleView_W * 0.5, 60, titleView_W, 200)
       
        presentViewController(popoverVC, animated: true, completion: nil)
        
        
        
    }
    
}



// MARK:- 自定义类

class TitleView: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: .Normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), forState: .Selected)
        setTitleColor(UIColor.blackColor(), forState: .Normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        return CGRectMake(0, 0, bounds.size.width * 0.8, bounds.size.height)
    }
   
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let image_H : CGFloat = 4.0
        
        return CGRectMake(bounds.size.width * 0.8, bounds.size.height * 0.5 - image_H * 0.5, bounds.size.width * 0.2, image_H)
    }

}


