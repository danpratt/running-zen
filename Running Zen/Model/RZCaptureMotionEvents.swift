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
    
    var updateSpeed: RZUpdateMotionSpeed?
    
    // timer will count steps to calculate video speed
    let timerInterval: Double = 5.0
    var timer: Timer? = nil
    
    init() {
        // setup the timer
        setupTimer()
    }
    
    func motionUpdate(motion: GCMotion) {
        let currentMotionDirection = motion.gravity.z > 0 ? MotionDirection.up : MotionDirection.down
        
        if lastMotionDirection != currentMotionDirection {
            stepCount += 1
            lastMotionDirection = currentMotionDirection
//            print("Step number: \(stepCount) was taken")
        }
    }
    
    // create timer to count steps per time interval
    // This sets up a timer used for playing bell audio
    private func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true, block: { (timer) in
            print("There were \(self.stepCount) steps taken in time interval")
            self.updateSpeed?.updateMotionSpeed(sender: self)
            self.stepCount = 0
        })
    }
    
    deinit {
        timer = nil
    }
    
}
