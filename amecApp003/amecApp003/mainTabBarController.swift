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
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         let bien2 = tabBar.frame.size.height
        UserDefaults.standard.set(bien2, forKey: "heigh")
        tabBar.backgroundColor = UIColor.white
        tabBar.tintColor = UIColor.red

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }
  }
