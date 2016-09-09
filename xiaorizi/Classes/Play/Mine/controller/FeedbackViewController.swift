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
        
        let topSize = CGSizeMake(kScreenWidth, 130)
        topView.autoSetDimensionsToSize(topSize)
        topView.autoPinEdgeToSuperviewEdge(.Top, withInset: 64)
        topView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        
        
        self.view.addSubview(feedbackTextView)
        feedbackTextView.backgroundColor = UIColor.clearColor()
        let textViewSize = CGSizeMake(kScreenWidth - 10, 120)
        feedbackTextView.delegate = self;
        feedbackTextView.font = UIFont.systemFontOfSize(14)
        feedbackTextView.autoSetDimensionsToSize(textViewSize)
        feedbackTextView.autoPinEdgeToSuperviewEdge(.Top, withInset:   64 )
        feedbackTextView.autoPinEdgeToSuperviewEdge(.Left, withInset: 5)
        
        
//        电话或者邮箱
        let centerView = UIView.init()
        self.view.addSubview(centerView)
        centerView.backgroundColor = UIColor.whiteColor()
        let centerSize = CGSizeMake(kScreenWidth, 50)
        centerView.autoSetDimensionsToSize(centerSize)
        centerView.autoPinEdgeToSuperviewEdge(.Top, withInset: 64+120+20)
        centerView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        
        
        let textField = UITextField.init()
        centerView.addSubview(textField)
        textField.placeholder = "留下电话或者电话，以便我们给您回复"
        textField.backgroundColor = UIColor.clearColor()
        textField.font = UIFont.systemFontOfSize(14)
        textField.setValue(UIColor.lightGrayColor(), forKeyPath: "_placeholderLabel.textColor")
        let textSize = CGSizeMake(kScreenWidth - 10, 30)
        textField.autoSetDimensionsToSize(textSize)
        textField.autoPinEdgeToSuperviewEdge(.Left, withInset: 5)
        textField.autoPinEdgeToSuperviewEdge(.Top, withInset: 10)
       
        
    }
    
    
    func textViewDidChangeSelection(textView: UITextView) {

        if textView.text.isEmpty {
            
            feedbackTextView.placeholderLable.hidden = false
        }else{
            
            feedbackTextView.placeholderLable.hidden = true
        }
    }
    
    
    func rightBtnClick(){
        
        print("------发送-----")
    }
    
}
