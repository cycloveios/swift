//
//  EmoticonCollectionViewCell.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/22.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

class EmoticonCollectionViewCell: UICollectionViewCell {
    var emticon : Emoticon?{
        didSet{
            guard let emticon = emticon else {
                return
            }
            emticonBtn.setImage(UIImage(contentsOfFile: emticon.pngPath ?? ""), forState: .Normal)
            emticonBtn.setTitle(emticon.emojiCode, forState: .Normal)
        }
    }
    private lazy var emticonBtn : UIButton = UIButton()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    
    
}

extension EmoticonCollectionViewCell{
    private func setupUI() {
        contentView.addSubview(emticonBtn)
        
        emticonBtn.frame = contentView.bounds
        emticonBtn.userInteractionEnabled = false
        emticonBtn.titleLabel?.font = UIFont.systemFontOfSize(32)
    }
}
