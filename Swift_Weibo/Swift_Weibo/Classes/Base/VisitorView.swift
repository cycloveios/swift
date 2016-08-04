//
//  VisitorView.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/4.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    
    
    var loginBlock : (() -> ())?
    var registerBlock : (() -> ())?
    
    
    
    class func visitorView() -> VisitorView {
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).first as! VisitorView
    }
    
    func visitorViewInfo(message : String, imageName : String, isShowRotationView : Bool) {
        iconView.image = UIImage(named: imageName)
        tipLabel.text = message
        rotationView.hidden = !isShowRotationView;
    }
    
    func addRotationAnimation() {
        //1.创建动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnim.fromValue = 0
        rotationAnim.toValue = M_PI * 2
        //重复次数(最大)
        rotationAnim.repeatCount = MAXFLOAT
        rotationAnim.duration = 6
        rotationAnim.removedOnCompletion = false
        rotationView.layer.addAnimation(rotationAnim, forKey: nil)
    }
    

    
    @IBAction func clickBtn(sender: UIButton) {
        if sender.titleLabel?.text == "登录" {
            guard loginBlock != nil else{
                return
            }
            loginBlock!()
            
        }else if sender.titleLabel?.text == "注册"{
            guard registerBlock != nil else{
                return
            }
            registerBlock!()
        }
    }
    
    
    
}
