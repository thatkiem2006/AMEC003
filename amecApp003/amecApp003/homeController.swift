//
//  homeController.swift
//  amecApp003
//
//  Created by linhth on 10/19/17.
//  Copyright © 2017 adv. All rights reserved.
//

import UIKit
import GoogleMobileAds

class homeController: UIViewController, GADBannerViewDelegate , UITableViewDelegate , UITableViewDataSource {

    
    @IBOutlet weak var _viewAds: GADBannerView!
    @IBOutlet weak var _v1: UIView!
    @IBOutlet weak var _v2: UIView!
    @IBOutlet weak var _v3: UIView!
    @IBOutlet weak var _vContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupAds()
        setupForViewContainer()
        // chieu cao navigation bar
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: (41/442)*view.bounds.height)
        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xF8F8F8, a: 1)

        
    }
    
    
    
    
    func setupAds(){
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        
        // set up ad
        _viewAds.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        _viewAds.rootViewController = self
        _viewAds.delegate = self
        _viewAds.load(request)
        
        _viewAds.translatesAutoresizingMaskIntoConstraints = false
        _viewAds.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        _viewAds.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        _viewAds.heightAnchor.constraint(equalToConstant: (39/646)*self.view.frame.size.height).isActive = true
        _viewAds.topAnchor.constraint(equalTo: view.topAnchor, constant: (41/442)*view.bounds.height).isActive = true
    }
    
    func setupForViewContainer(){
        _vContainer.translatesAutoresizingMaskIntoConstraints = false
        _vContainer.topAnchor.constraint(equalTo: _viewAds.bottomAnchor, constant: 0).isActive = true
        _vContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        _vContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        let heigh = UserDefaults.standard.object(forKey: "heighTabbar") as! CGFloat
        
        _vContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: heigh ).isActive = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }


    
   
}
