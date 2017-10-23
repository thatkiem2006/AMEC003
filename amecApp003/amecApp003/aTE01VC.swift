//
//  aTE01VC.swift
//  amecApp003
//
//  Created by linhth on 10/23/17.
//  Copyright © 2017 adv. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class aTE01VC: UIViewController , GADBannerViewDelegate , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var _viewAds: GADBannerView!
    @IBOutlet weak var _viewVideo2: UIView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var _viewForQuestion: UIView!
    @IBOutlet weak var _btnAnswer: UIButton!
    @IBOutlet weak var viewCTN: UIView!
    @IBOutlet weak var txt: UILabel!
    
    static var bien1 : Int = 100
    var questionArray : [String] = ["That is a car.","That is a motorcycle."]
    var btn : UIButton!
    var view1 : UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("===========\(self.view.bounds.height)")
        //setupNavigationBar()
        setupAds()
        setupViewVideo()
        setUpTable()
        setupForViewQuestion()
       // setupForBtnAnswer()
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
        
//        _viewAds.translatesAutoresizingMaskIntoConstraints = false
//        _viewAds.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        _viewAds.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        _viewAds.heightAnchor.constraint(equalToConstant: (39/646)*self.view.frame.size.height).isActive = true
//        _viewAds.topAnchor.constraint(equalTo: view.topAnchor, constant: (41/442)*view.bounds.height).isActive = true
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
        _viewVideo2.leftAnchor.constraint(equalTo: viewCTN.leftAnchor).isActive = true
        _viewVideo2.rightAnchor.constraint(equalTo: viewCTN.rightAnchor).isActive = true
        _viewVideo2.bottomAnchor.constraint(equalTo: _viewForQuestion.topAnchor, constant: -2).isActive = true
       // _viewVideo2.heightAnchor.constraint(equalTo: viewCTN.heightAnchor, multiplier: 1/5).isActive = true
        
    }
    
    
    func  setupForViewQuestion() {
        _viewForQuestion.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(_viewForQuestion)
        _viewForQuestion.centerXAnchor.constraint(equalTo: viewCTN.centerXAnchor).isActive = true
       
        _viewForQuestion.leftAnchor.constraint(equalTo: viewCTN.leftAnchor, constant: 0).isActive = true
        
         _viewForQuestion.bottomAnchor.constraint(equalTo: table.topAnchor, constant: -2).isActive = true
        
        _viewForQuestion.heightAnchor.constraint(equalTo: viewCTN.heightAnchor, multiplier: 1/5).isActive = true
        
        _viewForQuestion.backgroundColor = UIColor(rgb: 0xF6EAF0, a: 1)
        
        txt.text = "This is a car. the car has a tire and a body. This is a car. the car has a tire and a body. What is this?"
        
    }
    
    func setUpTable(){
        table.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(table)
        table.centerXAnchor.constraint(equalTo: viewCTN.centerXAnchor).isActive = true
        
        table.leftAnchor.constraint(equalTo: viewCTN.leftAnchor, constant: 10).isActive = true
        table.bottomAnchor.constraint(equalTo: _btnAnswer.topAnchor, constant: -10).isActive = true
        table.heightAnchor.constraint(equalTo: viewCTN.heightAnchor, multiplier: 1/5).isActive = true
        
    }
    
    func setupForBtnAnswer() {
        _btnAnswer.backgroundColor = UIColor(rgb: 0x51A098, a: 1)
        
        
        _btnAnswer.layer.cornerRadius = 5
        _btnAnswer.translatesAutoresizingMaskIntoConstraints = false
        _btnAnswer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        _btnAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        _btnAnswer.heightAnchor.constraint(equalToConstant: (35/646)*view.bounds.height).isActive = true
        _btnAnswer.widthAnchor.constraint(equalToConstant: (180/335)*view.bounds.width).isActive = true
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("cellForAnserQuestion", owner: self, options: nil)?.first as! cellForAnserQuestion
        cell._lbl.font = cell._lbl.font.withSize(15)
        cell._lbl.text = questionArray[indexPath.row]
        
        if indexPath.row == registration.bien1 {
            cell._sw.setOn(true, animated: true)
            cell.contentView.backgroundColor = UIColor(rgb: 0x7296CA, a: 1)
            cell._lbl.textColor = UIColor.white
            
        } else {
            cell.backgroundColor = UIColor(rgb: 0xE8E7E6, a: 1)
            cell._sw.setOn(false, animated: true)
            cell._lbl.textColor = UIColor.gray
        }
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell : cellForAnserQuestion = tableView.cellForRow(at: indexPath)! as! cellForAnserQuestion
        
        registration.bien1 = indexPath.row
        // cell._lbl.textColor = UIColor.white
        table.reloadData()
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (52/646)*view.bounds.height
    }
    
    
    @IBAction func actionAnser(_ sender: AnyObject) {
         btn = UIButton()
        btn.backgroundColor = UIColor.lightGray
        btn.alpha = 0.8
        view.addSubview(btn)
        btn.frame = viewCTN.frame
        
        view1 = UIView()
        view1.backgroundColor = UIColor.white
        view1.alpha = 1
        view.addSubview(view1)
        view1.frame = CGRect(x: 20, y: _viewAds.frame.origin.y + _viewAds.frame.height + 20, width: self.view.bounds.width - 40, height: 200)
       
        let img = UIImageView()
        view1.addSubview(img)
        img.frame = CGRect(x: view1.frame.width/2 - 25, y: 20, width: 50, height: 50)
        img.image = UIImage(named: "face_correct")
        
        let title = UILabel()
        view1.addSubview(title)
        title.frame = CGRect(x: view1.frame.width/2 - 25, y: 20 + 60 , width: 150, height: 50)
        title.center.x = view1.center.x
        title.text = "Correct answer !"
        
        
        let view2 = UIView()
        view2.backgroundColor = UIColor(rgb: 0xBDD9F0, a: 1)
        view2.alpha = 1
        view1.addSubview(view2)
        view2.frame = CGRect(x: 0, y: view1.frame.height - 50, width: view1.frame.width, height: 50)
        
        let btn2 = UIButton()
        
        btn2.alpha = 1
        view2.addSubview(btn2)
        btn2.frame = CGRect(x: view2.frame.width/2 - 10, y: view2.frame.height/2 - 10, width: 20, height: 20)
        btn2.setImage(UIImage(named: "button_next"), for: UIControlState.normal)
        btn2.addTarget(self, action: #selector(perform1), for: .touchUpInside)
    }
    
    func perform1(){
        btn.isHidden = true
        view1.isHidden = true
    }
    


  

}


