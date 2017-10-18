//
//  registration2.swift
//  amecApp003
//
//  Created by linhth on 10/17/17.
//  Copyright © 2017 adv. All rights reserved.
//

import UIKit
import GoogleMobileAds

class registration2: UIViewController , GADBannerViewDelegate {

    @IBOutlet weak var _viewAds: GADBannerView!
    @IBOutlet weak var _strollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        setupAds()
       
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //let bottomOffset = CGPoint(x: 0, y: _strollView.contentSize.height - _strollView.bounds.size.height)
//        let bottomOffset = CGPoint(x: 0, y:500)
//        _strollView.setContentOffset(bottomOffset, animated: true)
        
    }
    
    func setupNavigationBar(){
        barBtnLeft()
        navigationItem.title = "TUTRIAL"
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.gray,
            NSFontAttributeName : UIFont(name: "Futura", size: 15)!
        ]
        
    }

    func  barBtnLeft(){
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "ic_forward2"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(fbButtonPressed), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func fbButtonPressed(){
        navigationController?.popViewController(animated: true)
    }
    
    func setupAds(){
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        
        // set up ad
        _viewAds.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        _viewAds.rootViewController = self
        _viewAds.delegate = self
        _viewAds.load(request)
    
    }
    
    @IBAction func actionTest(_ sender: AnyObject) {
        
        print("============koko======")
        let bottomOffset = CGPoint(x: 0, y:100)
        _strollView.setContentOffset(bottomOffset, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
