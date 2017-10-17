//
//  test002.swift
//  amecApp003
//
//  Created by linhth on 10/17/17.
//  Copyright © 2017 adv. All rights reserved.
//

import UIKit

class test002: UIViewController , UIScrollViewDelegate{

    var scrollView: UIScrollView!
    var containerView = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonOne = UIButton()
        
        
        buttonOne.frame = CGRect(x: 10, y: 50, width: 50, height: 50)
        buttonOne.backgroundColor = UIColor.green
        buttonOne.setTitle("test", for: UIControlState.normal)
        buttonOne.addTarget(self, action: Selector(("buttonAction1x1:")), for: UIControlEvents.touchUpInside)
        
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: 1000, height: 1000)
        
        containerView = UIView()
        
        
        scrollView.addSubview(containerView)
        view.addSubview(scrollView)
        self.view.addSubview(buttonOne)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        containerView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height:scrollView.contentSize.height)
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let view1 : UIView = UIView()
//        view1.backgroundColor = UIColor.gray
//        view.addSubview(view1)
//         view1.frame = CGRect(x: 20, y: 20, width: 200, height: 200)
//        
//        let stro : UIScrollView = UIScrollView()
//        view1.addSubview(stro)
//        stro.frame = CGRect(x: 10, y: 10, width: 150, height: 850)
//        
//        let view2 : UIView = UIView()
//        view2.backgroundColor = UIColor.yellow
//        stro.addSubview(view2)
//        view2.frame = CGRect(x: 10, y: 10, width: 150, height: 850)
        
    }


}
