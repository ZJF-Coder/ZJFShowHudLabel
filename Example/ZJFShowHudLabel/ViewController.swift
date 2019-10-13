//
//  ViewController.swift
//  ZJFShowHudLabel
//
//  Created by wwyy on 09/26/2019.
//  Copyright (c) 2019 wwyy. All rights reserved.
//

import UIKit
import ZJFShowHudLabel

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let btn = UIButton.init(frame: CGRect.init(x: 10, y: 100, width: 60, height: 30))
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(btnDidClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
        
        let btn1 = UIButton.init(frame: CGRect.init(x: 10, y: 160, width: 60, height: 30))
        btn1.backgroundColor = UIColor.blue
        btn1.addTarget(self, action: #selector(btn1DidClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn1)
        
    }
    
    @objc func btnDidClick() {
        ZJFShowHudLabel.shareHud()?.showInfo("测试", withTopY: 0, onDuration: 3)
    }
    
    @objc func btn1DidClick() {
        let dataArr:Array<[String:String]> = [["text":"男","id":"1"],["text":"女","id":"2"]]
        
//        let popView = ZJFPopTableView.init(frame: self.view.bounds, dataArr: dataArr)
        
//        popView.successBlock = { [weak self] (text,ID) in
//            ZJFShowHudLabel.shareHud()?.showInfo("text=\(text),id=\(ID)", withTopY: 0, onDuration: 3)
//        }
//        view.addSubview(popView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

