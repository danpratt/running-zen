//
//  RunningDestination.swift
//  running zen
//
//  Created by Daniel Pratt on 12/23/15.
//  Copyright © 2015 Daniel Pratt. All rights reserved.
//

import UIKit

class RunningDestination: UICollectionViewCell {
    
    static let reuseIdentifier = "RunningItemCell"
    @IBOutlet weak var runImage: UIImageView!  // Image for run video preview
    @IBOutlet weak var locationLabel: UILabel!  // Label that will say where the run is
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // These properties are also exposed in Interface Builder.
        runImage.adjustsImageWhenAncestorFocused = true
        runImage.clipsToBounds = false
        
        locationLabel.alpha = 0.0
    }
    
    // MARK: UICollectionReusableView
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Reset the label's alpha value so it's initially hidden.
        locationLabel.alpha = 0.0
    }
    
    // MARK: UIFocusEnvironment
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        /*
        Update the label's alpha value using the `UIFocusAnimationCoordinator`.
        This will ensure all animations run alongside each other when the focus
        changes.
        */
        coordinator.addCoordinatedAnimations({
            if self.isFocused {
                self.locationLabel.alpha = 1.0
            }
            else {
                self.locationLabel.alpha = 0.0
            }
            }, completion: nil)
    }
}
