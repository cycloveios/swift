//
//  PopoverAnimator.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/5.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit


//自定义转场 
class PopoverAnimator: NSObject {
    var isPresented = false
    ///设置要改变的位置大小
     var presenetedFrame = CGRectZero
    
    var callBack : ((isPresented : Bool)->())?
    
    
    init(callBack : (isPresented : Bool)->()) {
        self.callBack = callBack
    }
}

extension PopoverAnimator : UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning{
    
    
    //UIViewControllerTransitioningDelegate
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?{
        let vc = TitlePresentationController(presentedViewController: presented, presentingViewController: presenting)
        vc.presenetedFrame = presenetedFrame
        
        return vc
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //返回遵守协议的对象
        isPresented = false
        callBack!(isPresented : isPresented)
        return self
    }
    
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        callBack!(isPresented : isPresented)
        return self
    }
    
    
    //UIViewControllerAnimatedTransitioning
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        //WTF-----What the FUCK
        if !isPresented {
            //获取弹出的View
            let presentedView = transitionContext.viewForKey(UITransitionContextToViewKey)!
            transitionContext.containerView()?.addSubview(presentedView)
            presentedView.transform = CGAffineTransformMakeScale(1.0, 0.0)
            //设置锚点
            presentedView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                presentedView.transform =  CGAffineTransformIdentity
                }, completion: { (isComplete) in
                    //这句话是必须写的   告诉转场动画已经完成
                    transitionContext.completeTransition(true)
            })
            
        }else{
            let dismissView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                dismissView.transform =  CGAffineTransformMakeScale(1.0, 0.01)
                }, completion: { (isComplete) in
                    transitionContext.completeTransition(true)
            })
            
        }
        
    }
    
}



class TitlePresentationController: UIPresentationController {
    
    private lazy var coverView = UIView()
    
    var presenetedFrame = CGRectZero
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        presentedView()?.frame = presenetedFrame
        
        
        //添加蒙版
        containerView?.insertSubview(coverView, atIndex: 0)
        coverView.frame = containerView?.bounds ?? CGRectZero
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.4)
        let tap = UITapGestureRecognizer(target: self, action: #selector(TitlePresentationController.coverViewClick))
        coverView.addGestureRecognizer(tap)
        
        coverView.userInteractionEnabled = true
    }
    
//    override func containerViewDidLayoutSubviews() {
//        print(presentedView()?.frame)
//    }
//    
    
    func coverViewClick() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    ////要想这个方法实现没有问题    不过在willlayout中不得再添加别的view   不然会导致位置改变
    //    override func frameOfPresentedViewInContainerView() -> CGRect {
    //        let titleView_W : CGFloat = 200.0
    //        return CGRectMake(UIScreen.mainScreen().bounds.size.width * 0.5 - titleView_W * 0.5, 60, titleView_W, 200)
    //    }
    
}

