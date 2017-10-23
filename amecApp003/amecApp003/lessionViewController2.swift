//
//  lessionViewController2.swift
//  amecApp003
//
//  Created by linhth on 10/23/17.
//  Copyright © 2017 adv. All rights reserved.
//

import UIKit
import GoogleMobileAds

class lessionViewController2: UIViewController  , UITableViewDelegate , UITableViewDataSource , GADBannerViewDelegate{

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var _viewAds: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableview.backgroundColor = UIColor(rgb: 0xD4E3BB, a: 1)
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
        
    }
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellLessionVC21")! as UITableViewCell
            cell.backgroundColor = UIColor(rgb: 0xD4E3BB, a: 1)
            let img = cell.viewWithTag(1) as! UIImageView
            img.image = UIImage(named: "bt_setting2")
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellLessionVC22")! as UITableViewCell
            cell.backgroundColor = UIColor(rgb: 0xD4E3BB, a: 1)
            let v = cell.viewWithTag(5)! as UIView
            v.backgroundColor = UIColor(rgb: 0x9BB198, a: 1)
            let v2 = cell.viewWithTag(4)! as UIView
            v2.backgroundColor = UIColor.white
            
            let img = cell.viewWithTag(1) as! UIImageView
            img.image = UIImage(named: "")
            (cell.viewWithTag(2) as! UILabel).text = "Lessons "
            (cell.viewWithTag(2) as! UILabel).textColor = UIColor.white
            
            (cell.viewWithTag(3) as! UILabel).text = "Content "
            (cell.viewWithTag(3) as! UILabel).textColor = UIColor.white
            
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellLessionVC22")! as UITableViewCell
            cell.backgroundColor = UIColor(rgb: 0xD4E3BB, a: 1)
            let v = cell.viewWithTag(5)! as UIView
            v.backgroundColor = UIColor(rgb: 0xCFCFD0, a: 1)
            v.setTest()
            let v2 = cell.viewWithTag(4)! as UIView
            v2.backgroundColor = UIColor.gray
            
            let img = cell.viewWithTag(1) as! UIImageView
            img.image = UIImage(named: "")
            (cell.viewWithTag(2) as! UILabel).text = "Lesson " + "\(indexPath.row)"
            (cell.viewWithTag(2) as! UILabel).textColor = UIColor(rgb: 0xA6B4B2, a: 1)
            
            (cell.viewWithTag(3) as! UILabel).text = "Test " + "\(indexPath.row)"
            (cell.viewWithTag(3) as! UILabel).textColor = UIColor(rgb: 0xA6B4B2, a: 1)
            
            return cell
            
        }
        
//            let cell = UITableViewCell()
//            cell.textLabel?.text = "ke"
//            return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        self.performSegue(withIdentifier: "segueaCL02", sender: nil)
    }
}
