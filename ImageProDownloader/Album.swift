/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
                Album has an array of Photos loaded from the application bundle
            
*/

import UIKit

class Album: NSObject {
    // MARK: Properties
    
    var name : String 

    let photos: [Photo]
    
    init (name: String, photos: [Photo]) {
        self.name = name
        self.photos = photos
    }
}
