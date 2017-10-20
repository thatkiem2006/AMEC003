
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
            
            cell._viewCell.layer.shadowColor = UIColor.gray
                .cgColor
            
            cell._viewCell.layer.shadowOffset  = CGSize(width: 1, height: 1) //1.75
            cell._viewCell.layer.shadowRadius = 1.7
            cell._viewCell.layer.shadowOpacity = 1
            
            return cell
        } else {
          
            cell._img.image = UIImage(named: "")
            cell._viewLine.backgroundColor = UIColor(rgb: 0x3B5CA0, a: 1)
            cell._lbl1.text = "Lession " + "\(indexPath.row)"
            cell._lbl1.textColor = UIColor(rgb: 0x3B5CA0, a: 1)
            cell._lbl2.text = "test " + "\(indexPath.row)"
            cell._lbl2.textColor = UIColor.gray
            cell._viewCell.backgroundColor = UIColor.white
            cell._viewCell.layer.borderWidth = 1
            cell._viewCell.layer.borderColor = UIColor.gray.cgColor
            //cell._viewCell.dropShadow(color: .red, opacity: 1, offSet: CGSize(width: -0.1, height: 0.1), radius: 1, scale: true)
            cell._viewCell.layer.shadowColor = UIColor.gray
            .cgColor
            
            cell._viewCell.layer.shadowOffset  = CGSize(width: 1, height: 1) //1.75
            cell._viewCell.layer.shadowRadius = 1.7
            cell._viewCell.layer.shadowOpacity = 1
            

            
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


extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
