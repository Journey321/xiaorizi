//
//  MyCustomBtn.swift
//  xiaorizi
//
//  Created by zhike on 16/9/1.
//  Copyright © 2016年 zhike. All rights reserved.
//

import Foundation
class MyCustomBtn: UIButton {
    var iconImg = UIImageView()
    var nameLable = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        
//        icon
        iconImg = UIImageView.init()
        self.addSubview(iconImg)
        iconImg.backgroundColor = UIColor.clearColor()
        let iconSize = CGSizeMake(30, 30)
        iconImg.autoSetDimensionsToSize(iconSize)
        iconImg.autoPinEdgeToSuperviewEdge(.Top, withInset: 20)
        iconImg.autoPinEdgeToSuperviewEdge(.Left, withInset: ((kScreenWidth - 1)/2 - 30)/2.0)

        
//        name
        nameLable = UILabel.init()
        self.addSubview(nameLable)
        nameLable.text = "测试"
        nameLable.textColor = UIColor.init(rgbByFFFFFF: 0x4d4d4d)
        nameLable.font = UIFont.systemFontOfSize(16)
        nameLable.textAlignment = NSTextAlignment.Center
        let nameSize = CGSizeMake((kScreenWidth - 1)/2, 20)
        nameLable.autoSetDimensionsToSize(nameSize)
        nameLable.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        nameLable.autoPinEdge(.Top, toEdge:.Bottom, ofView: iconImg, withOffset: 10)
        print("输出宽度",self.width())
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}