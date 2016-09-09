//
//  FeedbackTextView.swift
//  xiaorizi
//
//  Created by zhike on 16/9/8.
//  Copyright © 2016年 zhike. All rights reserved.
//

import Foundation

class FeedbackTextView: UITextView {
    
//    占位符lable
    var placeholderLable = UILabel()
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        self.backgroundColor = UIColor.whiteColor()
        
        placeholderLable = UILabel.init()
        placeholderLable.numberOfLines = 0
        self.addSubview(placeholderLable)
        placeholderLable.text = "您的只言片语，[小日子]随时聆听，因您而美好!"
        placeholderLable.font = UIFont.systemFontOfSize(14)
        placeholderLable.textColor = UIColor.lightGrayColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = placeholderLable.text?.textSizeWithFont(UIFont.systemFontOfSize(14), constrainedToSize: CGSizeMake(kScreenWidth - 10, 0))
        
        let lableSize = CGSizeMake(kScreenWidth - 10, (size?.height)!)
        placeholderLable.autoSetDimensionsToSize(lableSize)
        placeholderLable.autoPinEdgeToSuperviewEdge(.Left, withInset: 5)
        placeholderLable.autoPinEdgeToSuperviewEdge(.Top, withInset: 8)

    }
    
}
