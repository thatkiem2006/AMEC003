//
//  chooselanguage.swift
//  amecApp003
//
//  Created by linhth on 10/10/17.
//  Copyright © 2017 adv. All rights reserved.
//

import UIKit

class chooselanguage: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var _btnChoose: UIButton!
    @IBOutlet weak var _footer: UIView!
    
    static var bien1 : Int = 100
    
    let table : UITableView = {
        let tab = UITableView()
        tab.translatesAutoresizingMaskIntoConstraints = false
        
        return tab
    }()
    
    let languageArray : [String] = ["english","vietnamme","japan","china","korean","spane"]
    
    @IBOutlet weak var _lblLanguage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(table)
        setUpTable()
        
        
        //table.isHidden = true
        
        table.delegate = self
        table.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self._footer.backgroundColor = UIColor(rgb: 0xE8E7E6, a: 1)
        table.separatorStyle = .none
        table.isScrollEnabled = false
        table.alpha = 0
        //table.frame.size.height = 215
        
        let name : String? = UserDefaults.standard.object(forKey: "nameLanguage") as? String
        if let nameToDisplay = name {
            _lblLanguage.text = nameToDisplay
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    
    
    
    
    
    
    
    
    
    @IBAction func chooselanguageAction(_ sender: AnyObject) {
        //table.isHidden = false
        
        UIView.animate(withDuration: 1, animations: {
            self.table.alpha = 1
            }, completion: nil)
    }
    
    
    
    
    
    func setUpTable(){
       // table.backgroundColor = UIColor.red
        table.centerXAnchor.constraint(equalTo: _btnChoose.centerXAnchor).isActive = true
        table.topAnchor.constraint(equalTo: _btnChoose.bottomAnchor, constant: 0).isActive=true
        table.widthAnchor.constraint(equalTo: _btnChoose.widthAnchor).isActive=true
        table.heightAnchor.constraint(equalToConstant: 210).isActive=true
        table.layer.cornerRadius = 5
        table.layer.borderWidth = 0.5
        table.layer.borderColor = UIColor.gray.cgColor
        //table.backgroundColor = UIColor(rgb: 0xE8E7E6, a: 1)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = languageArray[indexPath.row]
       
        if indexPath.row == chooselanguage.bien1 {
            cell.contentView.backgroundColor = UIColor(rgb: 0x7296CA, a: 1)
        } else {
            cell.backgroundColor = UIColor(rgb: 0xE8E7E6, a: 1)
        }
       
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _lblLanguage.text = languageArray[indexPath.row]
        

        chooselanguage.bien1 = indexPath.row
        
        table.reloadData()
        
        let cell : UITableViewCell = tableView.cellForRow(at: indexPath)!
      
        cell.textLabel?.textColor = UIColor.white
        
        
         UserDefaults.standard.set(languageArray[indexPath.row], forKey: "nameLanguage")
        
       // table.isHidden = true
        
        UIView.animate(withDuration: 1, animations: {
            self.table.alpha = 0
            }, completion: nil)
        
        
    }
    
    
}




extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}
