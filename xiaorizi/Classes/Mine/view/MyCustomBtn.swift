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

        
//        name
        nameLable = UILabel.init()
        self.addSubview(nameLable)
        nameLable.text = "测试"
        nameLable.textColor = UIColor.init(rgbByFFFFFF: 0x4d4d4d)
        nameLable.font = UIFont.systemFontOfSize(16)
        nameLable.textAlignment = NSTextAlignment.Center

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        icon frame
        let iconWidth = (kScreenWidth == 320 ? 25 : kScreenWidth * (30/667) )
        let iconSize = CGSizeMake(iconWidth, iconWidth)
        let topInterval = (self.height() - iconWidth - 30)/2
        
        iconImg.autoSetDimensionsToSize(iconSize)
        iconImg.autoPinEdgeToSuperviewEdge(.Top, withInset: topInterval)
        iconImg.autoPinEdgeToSuperviewEdge(.Left, withInset: ((kScreenWidth - 1)/2 - iconWidth)/2.0)

        
//        name frame
        let nameSize = CGSizeMake((kScreenWidth - 1)/2, 20)
        nameLable.autoSetDimensionsToSize(nameSize)
        nameLable.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        nameLable.autoPinEdge(.Top, toEdge:.Bottom, ofView: iconImg, withOffset: 10)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}