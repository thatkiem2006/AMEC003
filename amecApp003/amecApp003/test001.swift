//
//  test001.swift
//  amecApp003
//
//  Created by linhth on 10/12/17.
//  Copyright © 2017 adv. All rights reserved.
//

import UIKit
import GoogleMobileAds

class test001: UIViewController , GADBannerViewDelegate {

    var bannerView: GADBannerView!
    var time : Timer!
    var dem : Float = 0
    @IBOutlet weak var myBanner: GADBannerView!
    @IBOutlet weak var slide: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // request
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        
        // set up ad
        myBanner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        myBanner.rootViewController = self
        myBanner.delegate = self
        myBanner.load(request)
        
//        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
//        self.view.addSubview(bannerView)
//        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
//       // bannerView.adUnitID = "ca-app-pub-3727454112622769~7030718227"
//        bannerView.rootViewController = self
//        bannerView.load(GADRequest())
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        slide.maximumValue = 1
        slide.minimumValue = 0
        slide.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        
        time = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(xuLy), userInfo: nil, repeats: true)
    }
    
    
    func xuLy(){
       

    }
    
    
    @IBAction func getValue(_ sender: AnyObject) {
        print(slide.value)
    }

  

}
