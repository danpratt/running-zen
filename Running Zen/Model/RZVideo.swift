//
//  RZVideo.swift
//  Running Zen
//
//  Created by Daniel Pratt on 10/20/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation

protocol RZVideo {
    var label: String { get }
    var image: String { get }
    var url: URL { get }
    
    init(label: String, image: String, url: URL)
    
}
