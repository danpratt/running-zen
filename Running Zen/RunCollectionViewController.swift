//
//  RunCollectionViewController.swift
//  running zen
//
//  Created by Daniel Pratt on 12/23/15.
//  Copyright © 2015 Daniel Pratt. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class RunCollectionViewController: UICollectionViewController, AVPlayerViewControllerDelegate {
    
    let runningLabels: [String] = ["germany"]
    let runningImages: [String] = ["germany.jpg"]
    let runningVideos: [String] = ["germany"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return runningLabels.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RunningDestination = collectionView.dequeueReusableCell(withReuseIdentifier: "RunningItemCell", for: indexPath) as! RunningDestination
        cell.locationLabel.text = runningLabels[(indexPath as NSIndexPath).row]
        cell.runImage.image = UIImage(named: runningImages[(indexPath as NSIndexPath).row])
    
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \((indexPath as NSIndexPath).row) selected")
        /*let fileURL = URL(fileURLWithPath: runningVideos[(indexPath as NSIndexPath).row])*/
        let fileURL = Bundle.main.url(forResource: runningVideos[indexPath.row], withExtension: "mp4")
        print(String(describing: fileURL))
        
        // get ready for player storyboard
        let runPlayer = storyboard?.instantiateViewController(withIdentifier: "runPlayer") as! RunPlayerViewController
        runPlayer.runFile = fileURL!
        
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
