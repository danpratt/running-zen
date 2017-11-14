//
//  RunPlayerViewController.swift
//  running zen
//
//  Created by Daniel Pratt on 7/8/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import AVKit

class RunPlayerViewController: AVPlayerViewController {
    
    var runFile: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let asset = AVAsset(url: runFile)
        let assetKeys = [
            "playable",
            "hasProtectedContent"
        ]
        let playerItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: assetKeys)
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
         player = AVPlayer(playerItem: playerItem)
//        let url = URL(string: "https://dl.dropboxusercontent.com/s/k59q7mhasu2zac6/Simply%20Zen%20Movie.mp4")
//        player = AVPlayer(url: url!)
        player?.play()
    }

    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
    }
    
    // MARK: - Player Controller Functions
    @objc private func playerDidFinishPlaying() {
        print("Finished Playing")
        player?.pause()
        self.dismiss(animated: true, completion: nil)
    }

}
