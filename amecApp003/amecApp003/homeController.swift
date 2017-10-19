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
    @IBOutlet weak var _btn3_1: UIButton!
    @IBOutlet weak var _btn3_2: UIButton!
    @IBOutlet weak var _btn3_3: UIButton!
    @IBOutlet weak var _btn3_4: UIButton!
    @IBOutlet weak var _btn3_5: UIButton!
    
    @IBOutlet weak var _vContainer: UIView!
    
    let _space : CGFloat = 5
    var _heighBtn : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAds()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        // chieu cao navigation bar
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: (41/442)*view.bounds.height)
        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xF8F8F8, a: 1)

        setupForViewContainer()
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
       // _vContainer.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        let name  = UserDefaults.standard.object(forKey: "heigh") as! CGFloat
        
        _vContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -name).isActive = true
        
        _vContainer.addSubview(_v1)
        _vContainer.addSubview(_v2)
        _vContainer.addSubview(_v3)
        
        setupForV1()
        setupForV2()
        setupForV3()
    }
    
    func setupForV1() {
        _v1.translatesAutoresizingMaskIntoConstraints = false
        _v1.topAnchor.constraint(equalTo: _vContainer.topAnchor, constant: 0).isActive = true
        _v1.leftAnchor.constraint(equalTo: _vContainer.leftAnchor, constant: 0).isActive = true
        _v1.rightAnchor.constraint(equalTo: _vContainer.rightAnchor, constant: 0).isActive = true
        _v1.heightAnchor.constraint(equalTo: _vContainer.heightAnchor, multiplier: 142/340).isActive = true
        
    }
    
    func setupForV2() {
        _v2.translatesAutoresizingMaskIntoConstraints = false
        _v2.topAnchor.constraint(equalTo: _v1.bottomAnchor, constant: 0).isActive = true
        _v2.leftAnchor.constraint(equalTo: _vContainer.leftAnchor, constant: 0).isActive = true
        _v2.rightAnchor.constraint(equalTo: _vContainer.rightAnchor, constant: 0).isActive = true
        _v2.heightAnchor.constraint(equalToConstant: 5).isActive = true

    }
    
    func setupForV3() {
        _v3.translatesAutoresizingMaskIntoConstraints = false
        _v3.topAnchor.constraint(equalTo: _v2.bottomAnchor, constant: 0).isActive = true
        _v3.leftAnchor.constraint(equalTo: _vContainer.leftAnchor, constant: 0).isActive = true
        _v3.rightAnchor.constraint(equalTo: _vContainer.rightAnchor, constant: 0).isActive = true
        _v3.bottomAnchor.constraint(equalTo: _vContainer.bottomAnchor, constant: 0).isActive = true
        
        _heighBtn = (_v3.frame.size.height - 6*_space)/3
       // _heighBtn = (_v3.frame.size.height)/4
        
        
        setupForV3_1()
        setupForV3_2()
        setupForV3_3()
        setupForV3_4()
        setupForV3_5()
        
        

    }
    
    func setupForV3_1() {
        _btn3_1.translatesAutoresizingMaskIntoConstraints = false
        _btn3_1.topAnchor.constraint(equalTo: _v3.topAnchor, constant: _space).isActive = true
        _btn3_1.leftAnchor.constraint(equalTo: _v3.leftAnchor, constant: _space).isActive = true
        _btn3_1.rightAnchor.constraint(equalTo: _v3.rightAnchor, constant: -_space).isActive = true
        _btn3_1.heightAnchor.constraint(equalToConstant: _heighBtn).isActive = true
        
        print("===========\(_v3.frame.size.height )")
    }
    
    func setupForV3_2() {
        _btn3_2.translatesAutoresizingMaskIntoConstraints = false
        _btn3_2.topAnchor.constraint(equalTo: _btn3_1.bottomAnchor, constant: _space).isActive = true
        _btn3_2.leftAnchor.constraint(equalTo: _v3.leftAnchor, constant: _space).isActive = true
        _btn3_2.rightAnchor.constraint(equalTo: _v3.rightAnchor, constant: -_space).isActive = true
        _btn3_2.heightAnchor.constraint(equalToConstant: _heighBtn).isActive = true
    }
    func setupForV3_3() {
        _btn3_3.translatesAutoresizingMaskIntoConstraints = false
        _btn3_3.topAnchor.constraint(equalTo: _btn3_2.bottomAnchor, constant: _space).isActive = true
        _btn3_3.leftAnchor.constraint(equalTo: _v3.leftAnchor, constant: _space).isActive = true
        _btn3_3.rightAnchor.constraint(equalTo: _v3.rightAnchor, constant: -_space).isActive = true
        _btn3_3.heightAnchor.constraint(equalToConstant: _heighBtn).isActive = true
    }
    func setupForV3_4() {
        _btn3_4.translatesAutoresizingMaskIntoConstraints = false
        _btn3_4.topAnchor.constraint(equalTo: _btn3_3.bottomAnchor, constant: _space).isActive = true
        _btn3_4.leftAnchor.constraint(equalTo: _v3.leftAnchor, constant: _space).isActive = true
        _btn3_4.rightAnchor.constraint(equalTo: _v3.rightAnchor, constant: -_space).isActive = true
        _btn3_4.heightAnchor.constraint(equalToConstant: _heighBtn).isActive = true
    }
    
    func setupForV3_5() {
        _btn3_5.translatesAutoresizingMaskIntoConstraints = false
        _btn3_5.topAnchor.constraint(equalTo: _btn3_4.bottomAnchor, constant: _space).isActive = true
        _btn3_5.leftAnchor.constraint(equalTo: _v3.leftAnchor, constant: _space).isActive = true
        _btn3_5.rightAnchor.constraint(equalTo: _v3.rightAnchor, constant: -_space).isActive = true
        _btn3_5.heightAnchor.constraint(equalToConstant: _heighBtn).isActive = true
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
