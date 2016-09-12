//
//  FindCategoryBtn.swift
//  xiaorizi
//
//  Created by zhike on 16/9/12.
//  Copyright © 2016年 zhike. All rights reserved.
//

import Foundation

class FindCategoryBtn: UIButton {
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
        nameLable.font = UIFont.systemFontOfSize(14)
        nameLable.textAlignment = NSTextAlignment.Center
        nameLable.backgroundColor = UIColor.clearColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let iconSize = CGSizeMake(30, 30)
        iconImg.autoSetDimensionsToSize(iconSize)
        iconImg.autoPinEdgeToSuperviewEdge(.Top, withInset: 15)
        iconImg.autoPinEdgeToSuperviewEdge(.Left, withInset: (self.width() - 30)/2.0)
        
//        名字布局
        let nameSize = CGSizeMake(self.width(), 20)
        nameLable.autoSetDimensionsToSize(nameSize)
        nameLable.autoPinEdge(.Top, toEdge: .Bottom, ofView: iconImg, withOffset: 5)
        nameLable.autoMatchDimension(.Width, toDimension: .Width, ofView: self)
        nameLable.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
