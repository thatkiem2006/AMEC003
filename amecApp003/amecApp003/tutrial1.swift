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
    
    
    @IBOutlet weak var _viewVideo: UIView!
    @IBOutlet weak var _viewAds: GADBannerView!
    
    static var _isplay : Bool = false
    static var _isMute : Bool = false
    var timerProgressVideo : Timer!
    var player : AVPlayer! = nil
    let playerController = AVPlayerViewController()
    
    let _barButton : UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.title = "<"
        barButton.tintColor = UIColor.lightGray
        return barButton
    }()
    
    let _btnPlayPause2 : UIButton = {
        let btnPlayPause = UIButton()
       // btnPlayPause.addTarget(self, action: #selector(btnPlayAction), for: .touchUpInside)
        //btnPlayPause.translatesAutoresizingMaskIntoConstraints = false
        return btnPlayPause
    }()
    
    let _btnMute : UIButton = {
        let btnMute = UIButton()
      // btnMute.translatesAutoresizingMaskIntoConstraints = false
        return btnMute
    }()
    
    
     let progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.bar)
    let _sileSound = UISlider()
    lazy var topView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    

    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.title = "TUTRIAL"
       
        
        self.navigationItem.leftBarButtonItem = _barButton;
        
       setupAds()
       
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
        
        //=================== add player view
        view.addSubview(playerController.view)
        playerController.view.frame = self._viewVideo.frame
        playerController.showsPlaybackControls = false
        
       // playerController.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tutrial1.handleTap)))
       
        
        
        //==================
        
        // Add it to the view of AVPlayerViewController
        view.addSubview(topView)
        //topView.backgroundColor = UIColor.clear
        topView.alpha = 0.1
        topView.frame = self._viewVideo.frame
        
        // Bring it to front
        //self.view.bringSubview(toFront: topView)
        
        // Add a tap gesture recognizer
        topView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tutrial1.handleTap)))
        
        
        
        //================== add button play
        
        view.addSubview(_btnPlayPause2)
      //  _btnPlayPause2.center = playerController.view.center
        _btnPlayPause2.frame = CGRect(x: _viewVideo.center.x - 25 , y: playerController.view.center.y - 25, width: 50, height: 50)
        _btnPlayPause2.setImage(UIImage(named: "play")?.withRenderingMode(.alwaysOriginal), for: .normal)
        _btnPlayPause2.imageView?.contentMode = UIViewContentMode.scaleToFill
        
        _btnPlayPause2.addTarget(self, action: #selector(btnPlayAction), for: .touchUpInside)
        _btnPlayPause2.isHidden = true
        
        
        //================== add button mute
        
      view.addSubview(_btnMute)
        
        _btnMute.frame = CGRect(x: self.view.bounds.width - 30, y: _viewVideo.frame.origin.y + _viewVideo.bounds.height - 30, width: 20, height: 20)
      // _btnMute.backgroundColor = UIColor.red
        _btnMute.setImage(UIImage(named: "voice_off")?.withRenderingMode(.alwaysOriginal), for: .normal)
        _btnMute.imageView?.contentMode = UIViewContentMode.scaleToFill
        _btnMute.addTarget(self, action: #selector(btnMuteAction), for: .touchUpInside)
        _btnMute.isHidden = true
        
        
        //============== add progress bar
        
        view.addSubview(progressView)
        progressView.frame = CGRect(x:  0, y: _viewVideo.frame.origin.y + _viewVideo.bounds.height , width: self.view.bounds.width, height: 5)
        //progressView.backgroundColor = UIColor.red
        progressView.progress = 0
        progressView.progressTintColor = UIColor.red
        progressView.trackTintColor = UIColor.lightGray
        //progressView.isHidden = true
        
        timerProgressVideo = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(actionProgreaaVideo), userInfo: nil, repeats: true)
        
        print("=======================")
        
       
        
        //================= add slideSound
        
        view.addSubview(_sileSound)
       _sileSound.maximumValue = 1
        
        _sileSound.minimumValue = 0
        _sileSound.value = 1
        _sileSound.thumbTintColor = UIColor.white
        _sileSound.minimumTrackTintColor = UIColor.white
        _sileSound.maximumTrackTintColor = UIColor.gray
        _sileSound.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        _sileSound.frame = CGRect(x:  self._btnMute.center.x, y: self._btnMute.frame.origin.y - 2*self._sileSound.bounds.height - 2*_btnMute.bounds.height, width: 5 , height: 100)
        _sileSound.addTarget(self, action: #selector(actionSlideSound), for: .valueChanged)
        _sileSound.isHidden = true
        

    
       
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
    
    
    
    func handleTap() {
        _btnPlayPause2.isHidden = !_btnPlayPause2.isHidden
        _btnMute.isHidden = !_btnMute.isHidden
       
        _sileSound.isHidden = !_sileSound.isHidden
        
        
       // progressView.isHidden = !progressView.isHidden
      // player.play()
        
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
    }
    
}




