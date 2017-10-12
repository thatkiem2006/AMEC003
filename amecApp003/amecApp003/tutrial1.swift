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
        
        
        //============== add progress bar
        
        view.addSubview(progressView)
        progressView.frame = CGRect(x:  30, y: _viewVideo.frame.origin.y + _viewVideo.bounds.height - 20, width: self.view.bounds.width - 100 , height: 10)
        progressView.backgroundColor = UIColor.red
        
        print("=======================")
        print(playerItemDuration())
       
        
        
       
        
//        player.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1/30.0, Int32(NSEC_PER_SEC)), queue: nil) { time in
//            let duration = CMTimeGetSeconds(thePlayerItem.duration)
//            self.progressView.progress = Float((CMTimeGetSeconds(time) / duration))
        
        
//      var   tg = CMTimeGetSeconds(player.duration);
//        double time = CMTimeGetSeconds(_player.currentTime);
//        _progressView.progress = (CGFloat) (time / duration);
//        
       
    }
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func playerItemDuration() -> CMTime
    {
        let thePlayerItem : AVPlayerItem = player.currentItem!
        if (thePlayerItem.status == .readyToPlay)
        {
            
            return thePlayerItem.duration
        }
        
        return(kCMTimeInvalid);
    }
    
    
    
    
    func btnMuteAction(){
        
        tutrial1._isMute = !tutrial1._isMute
        player.isMuted = !player.isMuted
        
        if tutrial1._isMute {
           
            _btnMute.setImage(UIImage(named: "voice_on")?.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            
            _btnMute.setImage(UIImage(named: "voice_off")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
    
    
    
    func handleTap() {
        _btnPlayPause2.isHidden = !_btnPlayPause2.isHidden
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




