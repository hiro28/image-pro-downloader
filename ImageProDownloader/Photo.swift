/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
                Photo represents an image that can be imported.
            
*/

import UIKit


struct Photo: JSONConstructable {
    
    var image: UIImage?
    
    init(urlString: String) {
       
        self.image = UIImage(contentsOfFile: urlString)
    }
    
    static func fromURLString(urlString: String) -> Photo? {
        return Photo(urlString: urlString)
    }
}
