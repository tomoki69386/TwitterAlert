//
//  ViewController.swift
//  Demo
//
//  Created by 築山朋紀 on 2018/11/24.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tap() {
        let customView = TwitterAlert()
        customView.load(item: ["コメント", "リツイート"])
        customView.frame = self.view.bounds
        self.view.addSubview(customView)
    }


}

