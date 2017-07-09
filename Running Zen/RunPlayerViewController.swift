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
        player = AVPlayer(url: runFile)
        player?.play()
    }

    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
