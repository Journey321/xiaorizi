//
//  FindCustomTableViewCell.swift
//  xiaorizi
//
//  Created by zhike on 16/9/19.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class FindCustomTableViewCell: UITableViewCell {
    
    var bgImg = UIImageView()
    var titleLable = UILabel()
    var subTitleLable = UILabel()
    var isTheme = Bool()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.whiteColor()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //背景imageView
        bgImg = UIImageView.init()
        bgImg.backgroundColor = UIColor.init(rgbByFFFFFF: 0xb2b2b2)
        self.addSubview(bgImg)
        
        
        //标题
        titleLable = UILabel.init()
        titleLable.text = "天安门"
        titleLable.font = UIFont.boldSystemFontOfSize(20)
        titleLable.textColor = UIColor.whiteColor()
        titleLable.textAlignment = NSTextAlignment.Center
        bgImg.addSubview(titleLable)
        
        
        //子标题
        subTitleLable = UILabel.init()
        subTitleLable.text = "测试而已，不要怕"
        subTitleLable.font = UIFont.systemFontOfSize(14)
        subTitleLable.textAlignment = NSTextAlignment.Center
        subTitleLable.textColor = UIColor.whiteColor()
        bgImg.addSubview(subTitleLable)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bgSize = CGSizeMake(kScreenWidth, self.height() - 4)
        bgImg.autoSetDimensionsToSize(bgSize)
        bgImg.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        bgImg.autoPinEdgeToSuperviewEdge(.Top, withInset: 0)
        
        
        let lableSize = CGSizeMake(kScreenWidth, 20)
        titleLable.autoSetDimensionsToSize(lableSize)
        titleLable.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        titleLable.autoPinEdgeToSuperviewEdge(.Top, withInset: (self.height() - 4 - 20 - (self.isTheme ? (15+15) : 0))/2.0)
        
        
        let subSize = CGSizeMake(self.isTheme ? kScreenWidth : 0, 15)
        subTitleLable.autoSetDimensionsToSize(subSize)
        subTitleLable.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLable, withOffset: 15)
        subTitleLable.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
