//
//  tutrial1.swift
//  amecApp003
//
//  Created by linhth on 10/11/17.
//  Copyright © 2017 adv. All rights reserved.
//

import UIKit

class tutrial1: UIViewController {
    
    let _barButton : UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.title = "<"
        barButton.tintColor = UIColor.lightGray
        return barButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.title = "TUTRIAL"
       
        
        self.navigationItem.leftBarButtonItem = _barButton;
       
    }
    
    

    
}
