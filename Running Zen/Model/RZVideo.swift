//
//  RZVideo.swift
//  Running Zen
//
//  Created by Daniel Pratt on 10/20/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation

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

extension RZVideo {
    static func testVideos() -> [RZVideo] {
        return [
            RZVideo(label: "Germany", image: "germany.jpg", url: URL(string: "https://dl.dropboxusercontent.com/s/k59q7mhasu2zac6/Simply%20Zen%20Movie.mp4")!),
            RZVideo(label: "Seattle", image: "seattle.jpg", url: URL(string: "https://dl.dropboxusercontent.com/s/o9ki1x72zxzpx3i/Walk_in_Forest.mp4")!)
        ]
    }
}
