//
//  UIColor+Util.swift
//  E_EducationBySwift
//
//  Created by JohnSon on 15/12/24.
//  Copyright © 2015年 JohnSon. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{
    
    /**
     获取16进制颜色值
     */
    convenience init(rgbByFFFFFF:Int){
        self.init(rgbByFFFFFF:rgbByFFFFFF,alpha:1)
    }
    /**
     获取16进制颜色值 带透明度
     */
    convenience init(rgbByFFFFFF:Int,alpha:CGFloat){
        self.init(red: CGFloat(Float((rgbByFFFFFF&0xff0000)>>0x10)/255), green:CGFloat(Float((rgbByFFFFFF&0xff00)>>8)/255), blue: CGFloat(Float(rgbByFFFFFF&0xff)/255), alpha: alpha)
    }
    
    func image()->UIImage{
        let rect=CGRect(x: 0.0, y:0.0, width:1.0,height: 1.0);
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, self.CGColor);
        CGContextFillRect(context, rect);
        let theImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return theImage
        
    }
}
