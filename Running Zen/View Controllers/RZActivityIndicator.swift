//
//  RZActivityIndicator.swift
//  Running Zen
//
//  Created by Daniel Pratt on 11/15/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import UIKit

// This class presents an activity view over an existing view
class RZActivityIndicator {
    
    enum Color {
        case white, blue, gray
    }
    
    var loadingActivityIndicator:UIActivityIndicatorView!
    var loadingLabel: UILabel!
    
    func beginLoadingActivity(viewController:UIViewController, color: Color)
    {
        loadingActivityIndicator = UIActivityIndicatorView(frame:CGRect(x: 500, y: 500, width: 500, height: 500)) as UIActivityIndicatorView
        loadingActivityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        loadingActivityIndicator.sizeToFit()
        switch color {
        case .white:
            loadingActivityIndicator.color = UIColor.white
        case .blue:
            loadingActivityIndicator.color = UIColor(red: 1.0/255.0, green: 179.0/255.0, blue: 228.0/255.0, alpha: 1.0)
        case .gray:
            fallthrough
        default:
            loadingActivityIndicator.color = UIColor.gray
        }
        
        let screenBounds = UIScreen.main.bounds
        let centerX = screenBounds.size.width / 2
        let centerY = screenBounds.size.height / 2
        let loadingLabelCenterY = centerY + 48
        let activityIndicatorCenter = CGPoint(x: centerX, y: centerY)
        
        loadingActivityIndicator.center = activityIndicatorCenter
        
        loadingLabel = UILabel(frame: CGRect(x: centerX, y: loadingLabelCenterY, width: 600, height: 100))
        loadingLabel.font = UIFont(name: "Helvetica", size: 30)
        loadingLabel.text = "Loading Run...\nPlease place the Siri Remote in your pocket"
        loadingLabel.numberOfLines = 2
        loadingLabel.sizeToFit()
        loadingLabel.textAlignment = .center
        // reset frame so it is centered in screen
        let labelWidth = loadingLabel.frame.width
        let labelHeight = loadingLabel.frame.height
        let loadingLabelCenterX = centerX - (labelWidth / 2)
        loadingLabel.frame = CGRect(x: loadingLabelCenterX, y: loadingLabelCenterY, width: labelWidth, height: labelHeight)
        loadingLabel.textColor = UIColor.white
        
        // Add indicator and label to subview
        viewController.view.addSubview(loadingActivityIndicator)
        viewController.view.addSubview(loadingLabel)
        
        self.loadingActivityIndicator.startAnimating()
    }
    
    func endLoadingActivity(viewController:UIViewController)-> Void
    {
        loadingActivityIndicator.removeFromSuperview()
        loadingLabel.removeFromSuperview()
    }
    
    
}
