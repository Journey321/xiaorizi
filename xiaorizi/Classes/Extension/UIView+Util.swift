//
//  UIView+Util.swift
//  E_EducationBySwift
//
//  Created by JohnSon on 15/12/24.
//  Copyright © 2015年 JohnSon. All rights reserved.
//

import Foundation
import UIKit
/// 对UIView的扩展
extension UIView {
    /// X值
    var js_x: CGFloat {
        return self.frame.origin.x
    }
    /// Y值
    var js_y: CGFloat {
        return self.frame.origin.y
    }
    /// 宽度
    var js_width: CGFloat {
        return self.frame.size.width
    }
    ///高度
    var js_height: CGFloat {
        return self.frame.size.height
    }
    var js_size: CGSize {
        return self.frame.size
    }
    var js_point: CGPoint {
        return self.frame.origin
    }
}