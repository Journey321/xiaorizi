//
//  FeedbackViewController.swift
//  xiaorizi
//
//  Created by zhike on 16/9/8.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController,UITextViewDelegate {

    var feedbackTextView = FeedbackTextView.init()
    override func viewDidLoad() {
        self.title = "意见反馈"
        self.view.backgroundColor = UIColor.init(rgbByFFFFFF: 0xf9f9f9)
        
//        发送
        let rightItem = UIBarButtonItem.init(title: "发送", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(rightBtnClick))
            
        self.navigationItem.rightBarButtonItem = rightItem
        
        
//        意见反馈背景
        let topView = UIView.init()
        topView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(topView)
        
        let topSize = CGSizeMake(kScreenWidth, 150)
        topView.autoSetDimensionsToSize(topSize)
        topView.autoPinEdgeToSuperviewEdge(.Top, withInset: 64)
        topView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        
        
//        let textView = FeedbackTextView.init()
        self.view.addSubview(feedbackTextView)
        feedbackTextView.backgroundColor = UIColor.clearColor()
        let textViewSize = CGSizeMake(kScreenWidth - 10, 130)
        feedbackTextView.delegate = self;
        feedbackTextView.font = UIFont.systemFontOfSize(16)
        feedbackTextView.autoSetDimensionsToSize(textViewSize)
        feedbackTextView.autoPinEdgeToSuperviewEdge(.Top, withInset:   64 )
        feedbackTextView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)

    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool{
        
        feedbackTextView.placeholderLable.hidden = true
        return true
    }
    
    
    func rightBtnClick(){
        
        
    }
    
}
