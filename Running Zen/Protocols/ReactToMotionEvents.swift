//
//  ReactToMotionEvents.swift
//  Running Zen
//
//  Created by Daniel Pratt on 10/21/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import GameController

protocol ReactToMotionEvents {
    func motionUpdate(motion: GCMotion) -> Void
}
