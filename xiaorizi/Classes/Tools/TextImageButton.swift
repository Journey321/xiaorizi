//
//  TextImageButton.swift
//  xiaorizi
//
//  Created by JohnSon on 16/7/11.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

// MARK: 自定义button,文字在左边 图片在右边
class TextImageButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.font = theme.navItemFont
        titleLabel?.contentMode = UIViewContentMode.Center
        imageView?.contentMode = UIViewContentMode.Left
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.sizeToFit()
        titleLabel?.frame = CGRectMake(-5, 0, titleLabel!.js_width, js_height)
        imageView?.frame = CGRectMake(titleLabel!.js_width + 3 - 5, 0, js_width - titleLabel!.js_width - 3, js_height)
    }
}