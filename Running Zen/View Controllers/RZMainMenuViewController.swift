//
//  RZMainMenuViewController.swift
//  Running Zen
//
//  Created by Daniel Pratt on 10/18/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import GameController

class RZMainMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ReactToMotionEvents {
    
    enum MotionDirection: Int {
        case up = 0, down = 1
    }
    
    var lastMotionDirection: MotionDirection = .up
    
    var stepCount = 0
    
    func motionUpdate(motion: GCMotion) {
//        print("x: \(motion.userAcceleration.x)   y: \(motion.userAcceleration.y)")
        let currentMotionDirection = motion.gravity.z > 0 ? MotionDirection.up : MotionDirection.down
        
        if lastMotionDirection != currentMotionDirection {
            stepCount += 1
            lastMotionDirection = currentMotionDirection
            print("Step number: \(stepCount) was taken")
        }
        
    }

    let runningLabels: [String] = ["Germany", "Seattle"]
    let runningImages: [String] = ["germany.jpg", "germany.jpg"]
    let runningVideos: [URL] = [URL(string: "https://dl.dropboxusercontent.com/s/k59q7mhasu2zac6/Simply%20Zen%20Movie.mp4")!, URL(string: "https://dl.dropboxusercontent.com/s/k59q7mhasu2zac6/Simply%20Zen%20Movie.mp4")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.motionDelegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("Memory warning during main menu")
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return runningLabels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RunningDestination = collectionView.dequeueReusableCell(withReuseIdentifier: "RunningItemCell", for: indexPath) as! RunningDestination
        cell.locationLabel.text = runningLabels[(indexPath as NSIndexPath).row]
        cell.runImage.image = UIImage(named: runningImages[(indexPath as NSIndexPath).row])
        
        // Configure the cell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \((indexPath as NSIndexPath).row) selected")
        /*let fileURL = URL(fileURLWithPath: runningVideos[(indexPath as NSIndexPath).row])*/
//        let fileURL = Bundle.main.url(forResource: runningVideos[indexPath.row], withExtension: "mp4")
        let fileURL = runningVideos[indexPath.row]
        print(String(describing: fileURL))
        
        // get ready for player storyboard
        let runPlayer = storyboard?.instantiateViewController(withIdentifier: "runPlayer") as! RunPlayerViewController
        runPlayer.runFile = fileURL
        
        present(runPlayer, animated: true, completion: nil)
        
        /* runPlayer = AVPlayer(url: fileURL!)
         
         runPlayerViewControler.showsPlaybackControls = false
         runPlayerViewControler.player = runPlayer
         
         self.present(runPlayerViewControler, animated: true) { () -> Void in
         self.runPlayerViewControler.player?.play()
         } */
        
    }
    
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
     
     }
     */
    
    // MARK: AVPlayerViewControllerDelegate
}
