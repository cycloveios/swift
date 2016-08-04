//
//  MainViewController.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/3.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    private lazy var composeBtn = UIButton()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        self.tabBar.tintColor = UIColor.orangeColor()
        
        setupComposeBtn()
        
 
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
                for i in 0..<tabBar.items!.count{
            let item = tabBar.items![i]
            if i == 2 {
                item.enabled = false
            }
            
        }
        


    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

        
   
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

// MARK:- UI
extension MainViewController{
    private func setupComposeBtn(){
        
        self.composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        self.composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)

        self.composeBtn.addTarget(self, action:"composeBtnClick:", forControlEvents: .TouchUpInside)
        
        
        self.tabBar.addSubview(composeBtn)
        self.composeBtn.sizeToFit()
        self.composeBtn.center = CGPointMake(tabBar.center.x, tabBar.bounds.size.height * 0.5)
      
    }
}



extension MainViewController{
   @objc func composeBtnClick(btn : UIButton){
        
    }
}