//
//  ViewController.swift
//  xiaorizi
//
//  Created by zhike on 16/7/4.
//  Copyright © 2016年 zhike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton.init(frame: CGRectMake(100, 100, 100, 100))
        button.backgroundColor = UIColor.grayColor()
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        button.setTitle("Touch Me", forState: UIControlState.Normal)
        button.setTitle("Touch Me", forState: UIControlState.Highlighted)
//        button?.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button.tag = 100
        self.view.addSubview(button)
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

