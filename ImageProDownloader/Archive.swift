//
//  Zip.swift
//  ImageProDownloader
//
//  Created by Cuong Nguyen on 07/11/2016.
//  Copyright © 2016 Cuong Nguyen. All rights reserved.
//

import UIKit

struct Archive: JSONConstructable {
    var urlPath: URL?
    
    init(urlString: String) {
        
        self.urlPath = URL(fileURLWithPath: urlString)
    }
    
    static func fromURLString(urlString: String) -> Archive? {
        return Archive(urlString: urlString)
    }
}
