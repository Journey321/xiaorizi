//
//  MyCenterHeaderCell.swift
//  xiaorizi
//
//  Created by zhike on 16/9/2.
//  Copyright © 2016年 zhike. All rights reserved.
//

import Foundation

class MyCenterHeaderCell: UITableViewCell {

    var nameLable = UILabel()
    var headerImageView = UIImageView()
    
    
    override func awakeFromNib(){
        super.awakeFromNib()
        self.backgroundColor = UIColor.redColor()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLable.text = "头像"
        self.addSubview(nameLable)
        nameLable.font = UIFont.systemFontOfSize(18)
        nameLable.textColor = UIColor.blackColor()
        let nameSize = CGSizeMake(100, 20)
        nameLable.autoSetDimensionsToSize(nameSize)
        nameLable.autoPinEdgeToSuperviewEdge(.Left, withInset: 15)
        nameLable.autoPinEdgeToSuperviewEdge(.Top, withInset: 15)
        
        
//        头像
        self.addSubview(headerImageView)
        headerImageView.backgroundColor = UIColor.blackColor()
        headerImageView.layer.masksToBounds = true
        headerImageView.layer.cornerRadius = 20
        headerImageView.image = UIImage.init(named: "recommendad")
        let headerSize = CGSizeMake(40, 40)
        headerImageView.autoSetDimensionsToSize(headerSize)
        headerImageView.autoPinEdgeToSuperviewEdge(.Right, withInset: 30)
        headerImageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 5)
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
