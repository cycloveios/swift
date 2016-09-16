 //
//  EmotionFlowLayout.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/22.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit
 
 

class EmotionFlowLayout: UICollectionViewFlowLayout {
    var itemCount : Int = 7

    
    override func prepareLayout() {
        super.prepareLayout()
        
        let itemW = UIScreen.mainScreen().bounds.width / CGFloat(itemCount)
        itemSize = CGSizeMake(itemW, itemW)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .Horizontal
        collectionView?.pagingEnabled = true
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        
        let insetMargin = (collectionView!.bounds.height - 3 * itemW) / 2
        collectionView?.contentInset = UIEdgeInsets(top: insetMargin, left: 0, bottom: insetMargin, right: 0)
    }

}
