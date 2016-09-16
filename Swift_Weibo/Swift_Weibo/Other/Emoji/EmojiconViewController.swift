//
//  EmojiconViewController.swift
//  Swift_Weibo
//
//  Created by 蔡叶超 on 16/8/22.
//  Copyright © 2016年 cyc. All rights reserved.
//

import UIKit

private let EmotionCell = "EmotionCell"


class EmojiconViewController: UIViewController {

    private lazy var collectionView : UICollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: EmotionFlowLayout())
    
    private lazy var manager = EmotionManager()
    
    
    private lazy var toolBar : UIToolbar = UIToolbar()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
    }

    
}

// MARK:- UI
extension EmojiconViewController{
    private func setupUI() {
        view.addSubview(collectionView)
        view.addSubview(toolBar)
        collectionView.backgroundColor = UIColor.redColor()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        
        //VFL 加约束
        let views = ["toolBar" : toolBar, "collectionView" : collectionView]
        var cons = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[toolBar]-0-|", options: [], metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[collectionView]-0-[toolBar]-0-|", options: [.AlignAllLeft, .AlignAllRight], metrics: nil, views: views)
        view.addConstraints(cons)
        
        prepareForToolBar()
        prepareForCollectionView()
        
        
    }
    
    private func prepareForCollectionView() {

        collectionView.registerClass(EmoticonCollectionViewCell.self, forCellWithReuseIdentifier: EmotionCell)
        collectionView.dataSource = self
        

    }
    
    private func prepareForToolBar() {
        let titles = ["最近", "默认", "emoji", "xxx"]
        var index = 1000
        var tempItems = [UIBarButtonItem]()
        
        for title in titles {
            let item = UIBarButtonItem(title: title, style: .Plain, target: self, action: "itemClick:")
            item.tag = index
            index += 1
            tempItems.append(item)
            tempItems.append(UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil))
        }
        tempItems.removeLast()
        toolBar.items = tempItems
        toolBar.tintColor = UIColor.orangeColor()
    }
}


// MARK:- Action
extension EmojiconViewController{
    @objc private func itemClick(item : UIBarButtonItem){
        print(item.tag)
    }
}


// MARK:- Delegate
extension EmojiconViewController : UICollectionViewDataSource     {
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let count = manager.packages[section].emotions.count
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCellWithReuseIdentifier(EmotionCell, forIndexPath: indexPath) as! EmoticonCollectionViewCell
        let emoticon : Emoticon = manager.packages[indexPath.section].emotions[indexPath.item]
        cell.emticon = emoticon
        cell.backgroundColor = (indexPath.item % 2 == 0) ? UIColor.blackColor() : UIColor.greenColor()
        
        return cell
        
    }

}
