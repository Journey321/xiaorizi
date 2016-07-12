//
//  UIBarButtonItem+Util.swift
//  E_EducationBySwift
//
//  Created by JohnSon on 15/12/24.
//  Copyright © 2015年 JohnSon. All rights reserved.
//
import Foundation
import UIKit
extension UIBarButtonItem
{
    // 导航栏右边标题按钮
    class func barButtonItemWithTitle(title:String,target:AnyObject, action:Selector)->UIBarButtonItem
    {
        
        let btn:UIButton! = UIButton(type: UIButtonType.Custom) as  UIButton
        btn.frame = CGRectMake(0, 60, 100, 44)
        btn.titleLabel?.textAlignment = NSTextAlignment.Right
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        btn.setTitle(title, forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(14)
        
        return UIBarButtonItem(customView:btn)
    }
    // 导航栏左边图片按钮
    class func barButtonItemWithLeftIcon(icon:String,highlightedIcon:String,target:AnyObject, action:Selector)->UIBarButtonItem
    {
        let btn:UIButton! = UIButton(type: UIButtonType.Custom) as  UIButton
        btn.frame = CGRectMake(0, 0, 50, 44)
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        btn.setImage(UIImage(named: icon), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: highlightedIcon), forState: UIControlState.Highlighted)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        return UIBarButtonItem(customView:btn)
    }

    // 导航栏右边图片按钮
    class func barButtonItemWithRightIcon(icon:String,highlightedIcon:String,target:AnyObject, action:Selector)->UIBarButtonItem
    {
        let btn:UIButton! = UIButton(type: UIButtonType.Custom) as  UIButton
        btn.frame = CGRectMake(0, 0, 50, 44)
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -15)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        btn.setImage(UIImage(named: icon), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: highlightedIcon), forState: UIControlState.Highlighted)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        return UIBarButtonItem(customView:btn)
    }
    // 设置按钮的偏移量
    class func barButtonItemWithWidth(seperateWidth:CGFloat)->UIBarButtonItem
    {
        let negativeSeperator:UIBarButtonItem=UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        negativeSeperator.width=seperateWidth
        return negativeSeperator
    }
}