
import UIKit
import GoogleMobileAds

class lessionViewController: UIViewController , GADBannerViewDelegate , UITableViewDelegate , UITableViewDataSource {
    
    
    @IBOutlet weak var _table: UITableView!
    @IBOutlet weak var _viewAds: GADBannerView!
    

    var _rowSelected : Int = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _table.delegate = self
        _table.dataSource = self
        _table.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
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
    
    func setupNavigationBar(){
        
        // navigationbar color
        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xF8F8F8, a: 1)
        
        navigationItem.title = "Tips"
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.gray,
            NSFontAttributeName : UIFont(name: "Futura", size: 15)!
        ]
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTips") as! cellTips
        if indexPath.row == 0 {
            
            cell._img.image = UIImage(named: "lesson_done_2")
            cell._lbl1.text = "Lesson1"
            cell._lbl1.textColor = UIColor.white
            cell._lbl2.text = "Car"
            cell._lbl2.textColor = UIColor.white
            cell._viewLine.backgroundColor = UIColor.white
            cell._viewCell.backgroundColor = UIColor(rgb: 0x3B5CA0, a: 1)
            return cell
        } else {
          
            cell._img.image = UIImage(named: "")
            cell._viewLine.backgroundColor = UIColor(rgb: 0x3B5CA0, a: 1)
            cell._lbl1.text = "Lession " + "\(indexPath.row)"
            cell._lbl1.textColor = UIColor(rgb: 0x3B5CA0, a: 1)
            cell._lbl2.text = "test " + "\(indexPath.row)"
            cell._lbl2.textColor = UIColor.gray
            cell._viewCell.backgroundColor = UIColor.white

            
//            if _rowSelected == indexPath.row {
//                cell._viewCell2.backgroundColor = UIColor(rgb: 0xBDD9F0, a: 1)
//                cell._imgCell2.image = UIImage(named: "lesson_done")
//            } else {
//                cell._viewCell2.backgroundColor = UIColor.white
//                cell._imgCell2.image = UIImage(named: "")
//            }
            
            
           
            
            return cell
        }
        
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //_rowSelected = indexPath.row
        _table.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
  


}
