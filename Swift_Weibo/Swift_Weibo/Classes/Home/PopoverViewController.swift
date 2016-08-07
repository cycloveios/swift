//
//  PopoverViewController.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/5.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class PopoverViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    public let chooseInfoBlock : ((str : String) -> ())? = nil
    
    
    var dataArr = ["首页","好友圈","群微博"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.clearColor()
        tableView.separatorStyle = .None
        
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


extension PopoverViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId : String = "Cell"
        var tableCell = tableView.dequeueReusableCellWithIdentifier(cellId)
        if (tableCell == nil) {
            tableCell = UITableViewCell(style: .Default, reuseIdentifier: cellId)
            tableCell?.textLabel?.textColor = UIColor.orangeColor()
            tableCell?.backgroundColor = UIColor.clearColor()
        }
        
        tableCell?.textLabel?.text = dataArr[indexPath.row]
        
        return tableCell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
          tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        guard chooseInfoBlock != nil else{
            return
        }
        chooseInfoBlock!(str: dataArr[indexPath.row])
        
      
      
    }
}