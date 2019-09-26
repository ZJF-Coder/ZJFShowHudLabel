//
//  ViewController.swift
//  ZJFShowHudLabel
//
//  Created by wwyy on 09/26/2019.
//  Copyright (c) 2019 wwyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let btn = UIButton.init(frame: CGRect.init(x: 10, y: 100, width: 40, height: 20))
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(btnDidClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
        
    }
    
    @objc func btnDidClick() {
        ZJFShowHudLabel.shareHud()?.showInfo("测试", withTopY: 0, onDuration: 3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

