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
        
        table.isHidden = true
        
        table.delegate = self
        table.dataSource = self
        
    }
    
    
    
    
    
    
    
    @IBAction func chooselanguageAction(_ sender: AnyObject) {
        table.isHidden = false
    }
    
    
    
    
    
    func setUpTable(){
        table.centerXAnchor.constraint(equalTo: _btnChoose.centerXAnchor).isActive = true
        table.topAnchor.constraint(equalTo: _btnChoose.bottomAnchor, constant: 1).isActive=true
        table.widthAnchor.constraint(equalTo: _btnChoose.widthAnchor).isActive=true
        table.heightAnchor.constraint(equalToConstant: 150).isActive=true
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _lblLanguage.text = languageArray[indexPath.row]
        table.isHidden = true
    }
    
    
}
