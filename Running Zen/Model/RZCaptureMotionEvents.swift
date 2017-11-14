//
//  RZCaptureMotionEvents.swift
//  Running Zen
//
//  Created by Daniel Pratt on 11/14/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import GameController

enum MotionDirection: Int {
    case up = 0, down = 1
}

class RZCaptureMotionEvents: ReactToMotionEvents {
    
    var lastMotionDirection: MotionDirection = .up
    var stepCount = 0
    
    func motionUpdate(motion: GCMotion) {
        let currentMotionDirection = motion.gravity.z > 0 ? MotionDirection.up : MotionDirection.down
        
        if lastMotionDirection != currentMotionDirection {
            stepCount += 1
            lastMotionDirection = currentMotionDirection
            print("Step number: \(stepCount) was taken")
        }
    }
    
}
