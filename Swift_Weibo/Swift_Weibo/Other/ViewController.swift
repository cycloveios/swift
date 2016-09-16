//
//  ViewController.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/22.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.inputView = EmojiconViewController().view
        textView.becomeFirstResponder()
        
        
   
        
    }

}
