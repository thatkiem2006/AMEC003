//
//  registration.swift
//  amecApp003
//
//  Created by linhth on 10/17/17.
//  Copyright © 2017 adv. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class registration: UIViewController , GADBannerViewDelegate , UITableViewDelegate , UITableViewDataSource{

    
    
    @IBOutlet weak var _viewAds: GADBannerView!
    @IBOutlet weak var _viewVideo2: UIView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var _viewForQuestion: UIView!
    
    static var bien1 : Int = 100
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("===========\(self.view.bounds.height)")
        setupNavigationBar()
        setupAds()
        setupViewVideo()
        setUpTable()
        setupForViewQuestion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        setupNavigationBar()
//        setupAds()
//        setupViewVideo()
//        setUpTable()
    }
    
    
    
    func setupNavigationBar(){
        barBtnLeft()
        navigationItem.title = "TUTRIAL"
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.gray,
            NSFontAttributeName : UIFont(name: "Futura", size: 15)!
        ]
        
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
        _viewAds.heightAnchor.constraint(equalToConstant: (39/646)*self.view.frame.size.height)
        _viewAds.topAnchor.constraint(equalTo: view.topAnchor, constant: (41/442)*view.bounds.height).isActive = true
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
    
    func setupViewVideo() {
        _viewVideo2.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(_viewVideo2)
        _viewVideo2.topAnchor.constraint(equalTo: _viewAds.bottomAnchor, constant: 0).isActive = true
        _viewVideo2.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        _viewVideo2.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        _viewVideo2.heightAnchor.constraint(equalToConstant: (270/646)*view.frame.size.height).isActive = true
        
        
        // add components
        
       // addComponents()
    }
    
    
    func  setupForViewQuestion() {
        _viewForQuestion.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(_viewForQuestion)
        _viewForQuestion.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        _viewForQuestion.topAnchor.constraint(equalTo: _viewVideo2.bottomAnchor, constant: 2).isActive = true
        _viewForQuestion.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
       
        _viewForQuestion.heightAnchor.constraint(equalToConstant: (73/646)*view.bounds.height).isActive = true
        _viewForQuestion.backgroundColor = UIColor(rgb: 0xF6EAF0, a: 1)
        
    }
    
    func setUpTable(){
        table.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(table)
        table.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        table.topAnchor.constraint(equalTo: _viewForQuestion.bottomAnchor, constant: 2).isActive = true
        table.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        table.heightAnchor.constraint(equalToConstant: (117/646)*view.bounds.height).isActive = true
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = Bundle.main.loadNibNamed("cellForAnserQuestion", owner: self, options: nil)?.first as! cellForAnserQuestion
        //cell.textLabel?.text = "ke"
        cell._lbl.text = "ke"
        
        if indexPath.row == registration.bien1 {
            cell._sw.setOn(true, animated: true)
           cell.contentView.backgroundColor = UIColor(rgb: 0x7296CA, a: 1)
            //if !cell._sw.isOn {
                //cell._sw.setOn(true, animated: true)
           // }
            print("========\(registration.bien1)")
            
        } else {
            cell.backgroundColor = UIColor(rgb: 0xE8E7E6, a: 1)
            cell._sw.setOn(false, animated: true)
        }
        
       
        
        return cell
        
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell : cellForAnserQuestion = tableView.cellForRow(at: indexPath)! as! cellForAnserQuestion
        
        registration.bien1 = indexPath.row
        cell._lbl.textColor = UIColor.white
        table.reloadData()
        
        
        
        }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (52/646)*view.bounds.height
    }
    

    
    
}











