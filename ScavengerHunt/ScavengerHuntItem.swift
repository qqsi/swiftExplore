//
//  ScavengerHuntItem.swift
//  ScavengerHunt
//
//  Created by Cambi Guo on 9/24/14.
//  Copyright (c) 2014 Guo Tao. All rights reserved.
//

import UIKit

class ScavengerHuntItem: NSObject, NSCoding {
    
    private struct SerializationKeys {
        static let name = "name"
        static let photo = "photo"
    }
    
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
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(SerializationKeys.name) as String
        photo = aDecoder.decodeObjectForKey(SerializationKeys.photo) as? UIImage
    }
    

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: SerializationKeys.name)
        if let thePhoto = photo {
            aCoder.encodeObject(thePhoto, forKey: SerializationKeys.photo)
        }
    }
    
    
}