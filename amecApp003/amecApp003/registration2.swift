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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupAds()
    }

    
    func setupAds(){
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        
        // set up ad
        _viewAds.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        _viewAds.rootViewController = self
        _viewAds.delegate = self
        _viewAds.load(request)
        
//        _viewAds.translatesAutoresizingMaskIntoConstraints = false
//        _viewAds.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        _viewAds.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        _viewAds.heightAnchor.constraint(equalToConstant: (39/646)*self.view.frame.size.height).isActive = true
//        _viewAds.topAnchor.constraint(equalTo: view.topAnchor, constant: (41/442)*view.bounds.height).isActive = true
    }
}
