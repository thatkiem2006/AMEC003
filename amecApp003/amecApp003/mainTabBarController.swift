//
//  mainTabBarController.swift
//  amecApp003
//
//  Created by linhth on 10/19/17.
//  Copyright © 2017 adv. All rights reserved.
//

import UIKit

class mainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // chieu cao navigation bar
    //self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: (41/442)*view.bounds.height)
    //navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xF8F8F8, a: 1)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBar.backgroundColor = UIColor.white
        tabBar.tintColor = UIColor.red
        let bien = tabBar.frame
        tabBar.frame = CGRect(x: bien.origin.x, y: bien.origin.y - 20, width: bien.size.width, height: bien.size.height + 20)
    }
   // let tabBarHeight = self.tabBarController.tabBar.frame.size.height
}
