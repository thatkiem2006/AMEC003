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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self._footer.backgroundColor = UIColor(rgb: 0xE8E7E6, a: 1)
        table.separatorStyle = .none
        table.isScrollEnabled = false
        //table.frame.size.height = 215

    }
    
    
    
    
    
    
    
    @IBAction func chooselanguageAction(_ sender: AnyObject) {
        table.isHidden = false
    }
    
    
    
    
    
    func setUpTable(){
       // table.backgroundColor = UIColor.red
        table.centerXAnchor.constraint(equalTo: _btnChoose.centerXAnchor).isActive = true
        table.topAnchor.constraint(equalTo: _btnChoose.bottomAnchor, constant: 1).isActive=true
        table.widthAnchor.constraint(equalTo: _btnChoose.widthAnchor).isActive=true
        table.heightAnchor.constraint(equalToConstant: 215).isActive=true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(rgb: 0xE8E7E6, a: 1)
        
        cell.textLabel?.text = languageArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _lblLanguage.text = languageArray[indexPath.row]
        
       // UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
       // cell.contentView.backgroundColor = [UIColor yellowColor];

        let cell : UITableViewCell = tableView.cellForRow(at: indexPath)!
        cell.contentView.backgroundColor = UIColor(rgb: 0x7296CA, a: 1)
        
       // table.isHidden = true
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
