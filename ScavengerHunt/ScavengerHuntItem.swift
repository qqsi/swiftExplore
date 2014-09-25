//
//  ScavengerHuntItem.swift
//  ScavengerHunt
//
//  Created by Cambi Guo on 9/24/14.
//  Copyright (c) 2014 Guo Tao. All rights reserved.
//

import UIKit

class ScavengerHuntItem: NSObject {
    let name: String
    var photo: UIImage?
    var isComplete: Bool {
        get {
            return photo != nil;
        }
    }
    
    init(name: String) {
        self.name = name
    }
    

}