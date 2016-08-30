//
//  MineViewController.swift
//  xiaorizi
//
//  Created by JohnSon on 16/7/8.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
//    背景
    var bgScrollView : UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的"
        self.view.backgroundColor = UIColor.yellowColor()

        setupNav()
        background()
    }

    
    // MARK: 初始化导航栏
    func setupNav(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItemWithLeftIcon("news_3", highlightedIcon: "", target: self, action: #selector(MineViewController.privateMsgBtnClick))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.barButtonItemWithRightIcon("pcenter_1", highlightedIcon: "", target: self, action: #selector(MineViewController.personInfoBtnClick))
        
    }
    
    
    func background(){
        
        let button = UIButton(type: UIButtonType.Custom)
        button.frame = CGRectMake(100, 100, 100, 30)
        button.backgroundColor = UIColor.redColor()
        self.view.addSubview(button)
        
        
        bgScrollView = UIScrollView.init();
        self.view.addSubview(bgScrollView)
        bgScrollView.backgroundColor = UIColor.orangeColor()
        bgScrollView.translatesAutoresizingMaskIntoConstraints = false;
        
//        布局
        bgScrollView.autoPinEdgeToSuperviewEdge(.Top, withInset: 0)
        bgScrollView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        bgScrollView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 0)
        bgScrollView.autoPinEdgeToSuperviewEdge(.Right, withInset: 0)
        
//        使大小和self.view的大小相同
//        bgScrollView.autoMatchDimension(.Width, toDimension: .Width, ofView: self.view)
//        bgScrollView.autoMatchDimension(.Height, toDimension: .Height, ofView: self.view)
        
//        设置控件大小
//        let size = CGSizeMake(100, 100);
//        bgScrollView.autoSetDimensionsToSize(size)
        
        bgScrollView.contentSize = CGSizeMake(self.view.width(), self.view.height() * 1.5)
        
    }
    
    // MARK: 导航栏按钮点击事件
    func privateMsgBtnClick() {
        
    }
    func personInfoBtnClick() {
        
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
