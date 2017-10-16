//
//  tutrial1.swift
//  amecApp003
//
//  Created by linhth on 10/11/17.
//  Copyright © 2017 adv. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import GoogleMobileAds

class tutrial1: UIViewController , GADBannerViewDelegate {
    
    

    @IBOutlet weak var _viewAds: GADBannerView!
    @IBOutlet weak var _viewVideo2: UIView!
    @IBOutlet weak var _viewTextView: UITextView!
    @IBOutlet weak var _btnReadMore: UIButton!
    
    static var _isplay : Bool = false
    static var _isMute : Bool = false
    var dem : Int = 0
    var timerProgressVideo : Timer!
    var player : AVPlayer! = nil
    let playerController = AVPlayerViewController()
    
    
    let _btnPlayPause2 : UIButton = {
        let btnPlayPause = UIButton()
       // btnPlayPause.addTarget(self, action: #selector(btnPlayAction), for: .touchUpInside)
        btnPlayPause.translatesAutoresizingMaskIntoConstraints = false
        return btnPlayPause
    }()
    
    let _btnMute : UIButton = {
        let btnMute = UIButton()
       btnMute.translatesAutoresizingMaskIntoConstraints = false
        return btnMute
    }()
    
    
    let progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.bar)
    let _sileSound = UISlider()
    lazy var topView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    

    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
       
        
       
       
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        setupNavigationBar()
        setupAds()
        setupViewVideo()
        setupTextView()
        setupBtnReadMore()
       
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
    }
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func actionTest(_ sender: AnyObject) {
        
        if (self.player) != nil {
            let url = Bundle.main.path(forResource: "NoiNayCoAnh", ofType: "mp4")
            let asset = AVAsset(url: URL(fileURLWithPath: url!))
            
            // let duration = asset.duration
            let duration = asset.duration.seconds
            let minutes = Double(duration / 60)
            print(minutes)

        }
       print(player.currentTime().seconds)
        
        player.volume = 0
        print(player.status)
        
    }
    
    func setupViewVideo() {
        _viewVideo2.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(_viewVideo2)
        _viewVideo2.topAnchor.constraint(equalTo: _viewAds.bottomAnchor, constant: 0).isActive = true
        _viewVideo2.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        _viewVideo2.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        _viewVideo2.heightAnchor.constraint(equalToConstant: (206/446)*view.bounds.height).isActive = true
        
        // add components
        
        addComponents()
    }
    
    func actionProgreaaVideo(){
        let url = Bundle.main.path(forResource: "NoiNayCoAnh", ofType: "mp4")
        let asset = AVAsset(url: URL(fileURLWithPath: url!))
        
        // let duration = asset.duration
        let duration = asset.duration.seconds
        progressView.progress = Float(player.currentTime().seconds)/Float(duration)
        print(progressView.progress)
    }
    
    func actionSlideSound(){
        player.volume = _sileSound.value
        print(player.volume)
    }
    
    func btnMuteAction(){
        
        tutrial1._isMute = !tutrial1._isMute
        player.isMuted = !player.isMuted
        
        if tutrial1._isMute {
           
            _btnMute.setImage(UIImage(named: "voice_on")?.withRenderingMode(.alwaysOriginal), for: .normal)
            _sileSound.value = 0
        } else {
            
            _btnMute.setImage(UIImage(named: "voice_off")?.withRenderingMode(.alwaysOriginal), for: .normal)
            _sileSound.value = player.volume
        }
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
        barBtnLeft()
        navigationItem.title = "TUTRIAL"
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.gray,
            NSFontAttributeName : UIFont(name: "Futura", size: 15)!
        ]
        
    }
    
    func fbButtonPressed(){
        navigationController?.popViewController(animated: true)
    }
    
    func handleTap() {
        
        dem += 1;
        if dem == 8 {
            tacGia()
            dem = 0
        }
        _btnPlayPause2.isHidden = !_btnPlayPause2.isHidden
        _btnMute.isHidden = !_btnMute.isHidden
       
        _sileSound.isHidden = !_sileSound.isHidden
        
        
       // progressView.isHidden = !progressView.isHidden
      // player.play()
        
    }
    
    func tacGia() {
        let alert = UIAlertController(title: "tác giả", message: "gcl86ht@0962877090", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
 
    func btnPlayAction(){
        tutrial1._isplay = !tutrial1._isplay
       
        if tutrial1._isplay {
            player.play()
            _btnPlayPause2.setImage(UIImage(named: "pause")?.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            player.pause()
            _btnPlayPause2.setImage(UIImage(named: "play")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
    

    func playVideo(){
        let path = Bundle.main.path(forResource: "NoiNayCoAnh", ofType: "mp4")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        
       // let playerController = AVPlayerViewController()
        
        playerController.player = player
        
        self.addChildViewController(playerController)
        //self.view.addSubview(playerController.view)
        
        // playerController.view.frame = self._viewVideo.frame
        
        
       
        
        //player.play()
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
        _viewAds.heightAnchor.constraint(equalToConstant: (28/446)*view.bounds.height)
        _viewAds.topAnchor.constraint(equalTo: view.topAnchor, constant: (41/442)*view.bounds.height).isActive = true
    }
    
    func addComponents() {
                playVideo()
        
        //=================== add player view
                _viewVideo2.addSubview(playerController.view)
                playerController.view.frame = self._viewVideo2.bounds
                playerController.showsPlaybackControls = false
                
        //==================
        
                // Add it to the view of AVPlayerViewController
                _viewVideo2.addSubview(topView)
                //topView.backgroundColor = UIColor.clear
                topView.alpha = 0.1
                topView.frame = self._viewVideo2.bounds
        
                // Bring it to front
                //self.view.bringSubview(toFront: topView)
        
                // Add a tap gesture recognizer
                topView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tutrial1.handleTap)))
        
        // playerController.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tutrial1.handleTap)))
                
        //================== add button play
        
                _viewVideo2.addSubview(_btnPlayPause2)
        
                _btnPlayPause2.centerXAnchor.constraint(equalTo: _viewVideo2.centerXAnchor).isActive = true
                _btnPlayPause2.centerYAnchor.constraint(equalTo: _viewVideo2.centerYAnchor).isActive = true
                _btnPlayPause2.widthAnchor.constraint(equalToConstant: 50).isActive = true
                _btnPlayPause2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
                _btnPlayPause2.setImage(UIImage(named: "play")?.withRenderingMode(.alwaysOriginal), for: .normal)
                _btnPlayPause2.imageView?.contentMode = UIViewContentMode.scaleToFill
        
                _btnPlayPause2.addTarget(self, action: #selector(btnPlayAction), for: .touchUpInside)
                _btnPlayPause2.isHidden = true
                
    //================== add button mute
        
              _viewVideo2.addSubview(_btnMute)
                _btnMute.bottomAnchor.constraint(equalTo: _viewVideo2.bottomAnchor, constant: -10).isActive = true
                _btnMute.rightAnchor.constraint(equalTo: _viewVideo2.rightAnchor, constant: -20).isActive = true
                _btnMute.heightAnchor.constraint(equalToConstant: 20).isActive = true
                _btnMute.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
              //  _btnMute.frame = CGRect(x: self.view.bounds.width - 30, y: _viewVideo2.frame.origin.y + _viewVideo2.bounds.height - 30, width: 20, height: 20)
              // _btnMute.backgroundColor = UIColor.red
                _btnMute.setImage(UIImage(named: "voice_off")?.withRenderingMode(.alwaysOriginal), for: .normal)
                _btnMute.imageView?.contentMode = UIViewContentMode.scaleToFill
                _btnMute.addTarget(self, action: #selector(btnMuteAction), for: .touchUpInside)
                _btnMute.isHidden = true
        
        
    //============== add progress bar
        
                view.addSubview(progressView)
               // progressView.frame = CGRect(x:  0, y: _viewVideo2.frame.origin.y + _viewVideo2.bounds.height , width: self.view.bounds.width, height: 5)
        
                progressView.translatesAutoresizingMaskIntoConstraints = false
                progressView.topAnchor.constraint(equalTo: _viewVideo2.bottomAnchor, constant: 0).isActive = true
                progressView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
                progressView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
                progressView.heightAnchor.constraint(equalToConstant: 2).isActive = true
                //progressView.backgroundColor = UIColor.red
                progressView.progress = 0
                progressView.progressTintColor = UIColor.red
                progressView.trackTintColor = UIColor.lightGray
                //progressView.isHidden = true
        
                timerProgressVideo = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(actionProgreaaVideo), userInfo: nil, repeats: true)
        
                print("=======================")
        
        
        
    //================= add slideSound
        
                _viewVideo2.addSubview(_sileSound)
               _sileSound.maximumValue = 1
        
                _sileSound.minimumValue = 0
                _sileSound.value = 1
                _sileSound.thumbTintColor = UIColor.white
                _sileSound.minimumTrackTintColor = UIColor.white
                _sileSound.maximumTrackTintColor = UIColor.gray
        
        
                //_sileSound.frame = CGRect(x:  self._btnMute.center.x, y: self._btnMute.frame.origin.y - 2*self._sileSound.bounds.height - 2*_btnMute.bounds.height, width: 5 , height: 100)
        
                _sileSound.translatesAutoresizingMaskIntoConstraints = false
                _sileSound.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
                _sileSound.heightAnchor.constraint(equalToConstant: 20).isActive = true
                _sileSound.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
                _sileSound.bottomAnchor.constraint(equalTo: _btnMute.topAnchor, constant: -self._sileSound.bounds.width + 45).isActive = true
        
                _sileSound.rightAnchor.constraint(equalTo: view.rightAnchor, constant: self._sileSound.bounds.width/2 - 20).isActive = true
                _sileSound.addTarget(self, action: #selector(actionSlideSound), for: .valueChanged)
                _sileSound.isHidden = true
    }
    
    func setupTextView() {
        _viewTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(_viewTextView)
        _viewTextView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 12).isActive = true
        _viewTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        _viewTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        _viewTextView.heightAnchor.constraint(equalToConstant: (95/446)*view.bounds.height).isActive = true
       // _viewTextView.backgroundColor = UIColor.red
    }
    
    func setupBtnReadMore() {
        _btnReadMore.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(_viewTextView)
        _btnReadMore.topAnchor.constraint(equalTo: _viewTextView.bottomAnchor, constant: 5).isActive = true
        _btnReadMore.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true

    }
    
}




