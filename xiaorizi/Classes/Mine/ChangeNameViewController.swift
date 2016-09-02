//
//  ChangeNameViewController.swift
//  xiaorizi
//
//  Created by zhike on 16/9/2.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class ChangeNameViewController: UIViewController {
    var navigationTittle = ""
    var placeholderStr = ""
    override func viewDidLoad() {
        
        self.title = navigationTittle
        
        self.view.backgroundColor = UIColor.init(rgbByFFFFFF: 0xf9f9f9)
        
        let rightItem = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ChangeNameViewController.rightItemClick))
        self.navigationItem.rightBarButtonItem = rightItem
        
        
        let bgView = UIView.init()
        bgView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(bgView)
        let bgViewSize = CGSizeMake(kScreenWidth, 50)
        bgView.autoSetDimensionsToSize(bgViewSize)
        bgView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        bgView.autoPinEdgeToSuperviewEdge(.Top, withInset: 10 + 64)
        
        
        let textFiled = UITextField.init()
        textFiled.placeholder = placeholderStr
        textFiled.backgroundColor = UIColor.whiteColor()
        bgView.addSubview(textFiled)
        textFiled.clearButtonMode = UITextFieldViewMode.WhileEditing
        let textFieldSize = CGSizeMake(kScreenWidth - 20, 50)
        textFiled.autoSetDimensionsToSize(textFieldSize)
        textFiled.autoPinEdgeToSuperviewEdge(.Left, withInset: 15)
        textFiled.autoPinEdgeToSuperviewEdge(.Top, withInset: 0)
        
    }
    
    func rightItemClick(){

        self.navigationController?.popViewControllerAnimated(true)
    
    }
    
}
