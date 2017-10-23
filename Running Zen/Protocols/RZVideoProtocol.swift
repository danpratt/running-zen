//
//  RZVideoProtocol.swift
//  Running Zen
//
//  Created by Daniel Pratt on 10/21/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation

protocol RZVideoProtocol {
    var label: String { get }
    var image: String { get }
    var url: URL { get }
    init(label: String, image: String, url: URL)
}
