//
//  RunPlayerViewController.swift
//  running zen
//
//  Created by Daniel Pratt on 7/8/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import AVKit

class RunPlayerViewController: AVPlayerViewController, RZUpdateMotionSpeed {
    
    // url for location of run file
    var runFile: URL!
    
    // setup motion control delegate
    var runDelegate: RZCaptureMotionEvents? = RZCaptureMotionEvents()
    
    // keep track of old speed
    var lastStepCount = 0
    
    // activity indicator
    let indicator = RZActivityIndicator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Setup delegates
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.motionDelegate = runDelegate
        runDelegate?.updateSpeed = self
        let asset = AVAsset(url: runFile)
        let assetKeys = [
            "playable",
            "hasProtectedContent"
        ]
        
        // start activity indicator
        indicator.beginLoadingActivity(viewController: self, color: .white)
        
        // load up a player item
        let playerItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: assetKeys)
        
        // add notifications for when player starts to play, and when it finishes playing
        playerItem.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions.new, context: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
        
        // setup player and start playback
        player = AVPlayer(playerItem: playerItem)
        player?.play()
    }

    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
        // make sure resources are de-allocated
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.motionDelegate = nil
        runDelegate = nil
    }
    
    // MARK: - Player Controller Functions
    
    // make sure player is paused, delegates are deallocated and view is dismissed when video finishes
    @objc private func playerDidFinishPlaying() {

        player?.pause()
        // make sure resources are de-allocated
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.motionDelegate = nil
        runDelegate = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    // Remove activity indicator when video starts to play
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status" && player?.status == AVPlayerStatus.readyToPlay {
            indicator.endLoadingActivity(viewController: self)
        }
    }
    
    // MARK: - Update Motion Speed Delegate Method
    
    // Update motion speed test
    func updateMotionSpeed(sender: RZCaptureMotionEvents) {
        let steps = sender.stepCount
        if steps != lastStepCount {
            updatePlayerSpeed(withSteps: steps)
        }
    }
    
    // MARK: - Update Player Speed
    func updatePlayerSpeed(withSteps steps: Int) {
        var speed: Float = 0.0
        switch steps {
        case 0:
            print("0 steps case")
            speed = 0.0
        case 1...10:
            print("normal walk case")
            speed = Float(steps) * 0.07
            player?.rate = speed
        case 11...17:
            print("walking fast")
            speed = Float(steps) * 0.06
        case 18...22:
            print("Starting to run")
            speed = Float(steps) * 0.05
        case 23...28:
            print("Running quickly")
            speed = Float(steps) * 0.048
        case 28...70:
            print("Really fast run, holy crap!")
            // Should not be humanly possible to get up much past 40
            speed = Float(steps) * 0.047
        default:
            speed = 0.0
        }
        // update the player speed
        player?.rate = speed
        // update this steps count to last steps count
        lastStepCount = steps
    }

}
