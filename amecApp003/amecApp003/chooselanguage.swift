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
    @IBOutlet weak var _btnNext: UIButton!
    
    static var bien1 : Int = 100
    
    let table : UITableView = {
        let tab = UITableView()
        tab.translatesAutoresizingMaskIntoConstraints = false
        tab.layer.cornerRadius = 5
        tab.layer.borderWidth = 1
        tab.layer.borderColor = UIColor.lightGray.cgColor
        return tab
    }()
    
    let _viewContainer : UIView = {
        let viewContainer = UIView()
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        //viewContainer.backgroundColor = UIColor.gray
        viewContainer.layer.cornerRadius = 5
        return viewContainer
    }()
    
    let languageArray : [String] = ["english","vietnamme","japan","china","korean","spane"]
    
    @IBOutlet weak var _lblLanguage: UILabel!
    @IBOutlet weak var _lblTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(_viewContainer)
        setupForViewContainer()
        
        view.addSubview(table)
        setUpTable()
        
        view.addSubview(_lblTitle)
        setupLblTitle()
        
        table.isHidden = true
        
        
        
        
        
        table.delegate = self
        table.dataSource = self
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self._footer.backgroundColor = UIColor(rgb: 0xE8E7E6, a: 1)
        table.separatorStyle = .none
        table.isScrollEnabled = false
        table.alpha = 0
        //table.frame.size.height = 215
        
        
        // chieu cao navigation bar
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: (41/442)*view.bounds.height)
        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xF8F8F8, a: 1)
        
        //======= add bar button left
            barBtnLeft()
        //=======seup navigation bar
            setupNavigationBar()
        
        //===== setup footer
            setupFooter()
        
        
        //======== load name in userdefaults
        let name : String? = UserDefaults.standard.object(forKey: "nameLanguage") as? String
        if let nameToDisplay = name {
            _lblLanguage.text = nameToDisplay
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // chieu cao navigation bar
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: (41/442)*view.bounds.height)
        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xF8F8F8, a: 1)

        
    }
    
    

    
    
    func setupForViewContainer(){
        
        _viewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        _viewContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: (150/442)*view.bounds.height).isActive = true
        _viewContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        _viewContainer.heightAnchor.constraint(equalToConstant: (28/442)*view.bounds.height).isActive = true
        
        _viewContainer.addSubview(_btnChoose)
        _viewContainer.addSubview(_lblLanguage)
        
        
        setupBtnLanguage()
        setupLblLanguage()
        
        
        
       // setUpTable()
        
    }
    
    func setupFooter(){
        _footer.translatesAutoresizingMaskIntoConstraints = false
        _footer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        _footer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        _footer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        _footer.heightAnchor.constraint(equalToConstant: (33/442)*view.bounds.height).isActive = true
        _footer.backgroundColor  = UIColor(rgb: 0xDDE2E6, a: 1)
        
        _btnNext.translatesAutoresizingMaskIntoConstraints = false
        _footer.addSubview(_btnNext)
        _btnNext.centerYAnchor.constraint(equalTo: _footer.centerYAnchor).isActive = true
        _btnNext.rightAnchor.constraint(equalTo: _footer.rightAnchor, constant: -10).isActive = true
        _btnNext.widthAnchor.constraint(equalToConstant: _footer.bounds.height/5).isActive = true
        _btnNext.heightAnchor.constraint(equalToConstant: _footer.bounds.height/3).isActive = true
    }
    
    
    func  barBtnLeft(){
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "ic_forward2"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(fbButtonPressed), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func setupNavigationBar(){
        navigationItem.title = "LANGUAGE CHOICE"
        navigationController?.navigationBar.titleTextAttributes = [
        NSForegroundColorAttributeName : UIColor.gray,
        NSFontAttributeName : UIFont(name: "Futura", size: 15)!
        ]
        
        
        
    }
    
    func fbButtonPressed(){
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func setupLblTitle(){
        _lblTitle.translatesAutoresizingMaskIntoConstraints = false
        _lblTitle.centerXAnchor.constraint(equalTo: _viewContainer.centerXAnchor).isActive = true
        _lblTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: (107/442)*view.bounds.height).isActive = true
    }
    
    func setUpTable(){
        table.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        table.topAnchor.constraint(equalTo: _viewContainer.bottomAnchor, constant: 0).isActive = true
        table.leftAnchor.constraint(equalTo: _viewContainer.leftAnchor, constant: 0).isActive = true
        // table.widthAnchor.constraint(equalToConstant: _viewContainer.bounds.width).isActive = true
        table.heightAnchor.constraint(equalToConstant: 210).isActive = true
        
    }
    
    func setupBtnLanguage(){
        
        _btnChoose.translatesAutoresizingMaskIntoConstraints = false
        _btnChoose.centerXAnchor.constraint(equalTo: _viewContainer.centerXAnchor).isActive = true
        _btnChoose.topAnchor.constraint(equalTo: _viewContainer.topAnchor).isActive = true
        _btnChoose.leftAnchor.constraint(equalTo: _viewContainer.leftAnchor).isActive = true
        _btnChoose.bottomAnchor.constraint(equalTo: _viewContainer.bottomAnchor).isActive = true
        _btnChoose.addTarget(self, action: #selector(actionBtn), for: .touchUpInside)
        
    }
    
    func actionBtn(){
        print("*************")
        table.isHidden = !table.isHidden
        print("==========")
        
        if !table.isHidden {
            UIView.animate(withDuration: 1, animations: {
                self.table.alpha = 1
                }, completion: nil)
        }
        
    }
    
    func setupLblLanguage(){
        _lblLanguage.translatesAutoresizingMaskIntoConstraints = false
        _lblLanguage.centerXAnchor.constraint(equalTo: _viewContainer.centerXAnchor).isActive = true
        _lblLanguage.centerYAnchor.constraint(equalTo: _viewContainer.centerYAnchor).isActive = true
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = Bundle.main.loadNibNamed("cellForTableLanguage", owner: self, options: nil)?.first as! cellForTableLanguage
        //cell.textLabel?.text = languageArray[indexPath.row]
        cell._lbl.text = languageArray[indexPath.row]
        
        if indexPath.row == chooselanguage.bien1 {
            cell.contentView.backgroundColor = UIColor(rgb: 0x7296CA, a: 1)
            cell.img.image = UIImage(named: "selected")
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
        
        let cell : cellForTableLanguage = tableView.cellForRow(at: indexPath)! as! cellForTableLanguage
        
       // cell.textLabel?.textColor = UIColor.white
        cell._lbl.textColor = UIColor.white
        
        
        UserDefaults.standard.set(languageArray[indexPath.row], forKey: "nameLanguage")
       
//        UIView.animate(withDuration: 0.5, animations: {
//            self.table.alpha = 0
//            }) { (true) in
//                self.table.isHidden = true
//        }
        
        self.table.isHidden = true
        
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
