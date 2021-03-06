//
//  RZMainMenuViewController.swift
//  Running Zen
//
//  Created by Daniel Pratt on 10/18/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class RZMainMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let runningLabels: [String] = ["Germany", "Seattle"]
    let runningImages: [String] = ["germany.jpg", "germany.jpg"]
    let runningVideos: [URL] = [URL(string: "https://dl.dropboxusercontent.com/s/k59q7mhasu2zac6/Simply%20Zen%20Movie.mp4")!, URL(string: "https://dl.dropboxusercontent.com/s/o9ki1x72zxzpx3i/Walk_in_Forest.mp4")!]
    
    let testModel = RZVideo.testVideos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)    }
    
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
        return testModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RunningDestination = collectionView.dequeueReusableCell(withReuseIdentifier: "RunningItemCell", for: indexPath) as! RunningDestination
        let runCellItem = testModel[indexPath.row]
        cell.locationLabel.text = runCellItem.label
        cell.runImage.image = UIImage(named: runCellItem.image)
//        cell.locationLabel.text = runningLabels[(indexPath as NSIndexPath).row]
//        cell.runImage.image = UIImage(named: runningImages[(indexPath as NSIndexPath).row])
        
        // Configure the cell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // load up correct video file
        let fileURL = testModel[indexPath.row].url
        print(String(describing: fileURL))
        
        // get ready for player storyboard
        let runPlayer = storyboard?.instantiateViewController(withIdentifier: "runPlayer") as! RunPlayerViewController
        runPlayer.runFile = fileURL
        
        present(runPlayer, animated: true, completion: nil)
        
    }
    
}
