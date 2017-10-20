//
//  RZVideo.swift
//  Running Zen
//
//  Created by Daniel Pratt on 10/20/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation

protocol RZVideoProtocol {
    var label: String { get }
    var image: String { get }
    var url: URL { get }
    init(label: String, image: String, url: URL)
}

struct RZVideo: RZVideoProtocol {
    let label: String
    let image: String
    let url: URL
    
    init(label: String, image: String, url: URL) {
        self.label = label
        self.image = image
        self.url = url
    }
    
    
}
