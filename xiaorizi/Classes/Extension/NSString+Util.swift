//
//  NSString+Util.swift
//  
//
//  Created by zhike on 16/9/5.
//
//

import Foundation
import CoreLocation
extension String {
    /// 判断是否是邮箱
    func validateEmail() -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluateWithObject(self)
    }
    
    /// 判断是否是手机号
    func validateMobile() -> Bool {
        let phoneRegex: String = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluateWithObject(self)
    }
    
    /// 将字符串转换成经纬度
    func stringToCLLocationCoordinate2D(separator: String) -> CLLocationCoordinate2D? {
        let arr = self.componentsSeparatedByString(separator)
        if arr.count != 2 {
            return nil
        }
        
        let latitude: Double = NSString(string: arr[1]).doubleValue
        let longitude: Double = NSString(string: arr[0]).doubleValue
        
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    
  
        func textSizeWithFont(font: UIFont, constrainedToSize size:CGSize) -> CGSize {
            var textSize:CGSize!
            if CGSizeEqualToSize(size, CGSizeZero) {
                let attributes = NSDictionary(object: font, forKey: NSFontAttributeName)
                textSize = self.sizeWithAttributes(attributes as? [String : AnyObject])
            } else {
                let option = NSStringDrawingOptions.UsesLineFragmentOrigin
                let attributes = NSDictionary(object: font, forKey: NSFontAttributeName)
                let stringRect = self.boundingRectWithSize(size, options: option, attributes: attributes as? [String : AnyObject], context: nil)
                textSize = stringRect.size
            }
            return textSize
        }
    
    

    
}









