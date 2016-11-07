//
//  HCOperation.swift
//  ImageProDownloader
//
//  Created by Cuong Nguyen on 06/11/2016.
//  Copyright © 2016 Cuong Nguyen. All rights reserved.
//

import UIKit

final class HCOperation<RequestResource: SendableRequest>: BaseOperation  {

    typealias DidSuccessCallback = (_ result: RequestResource.ParsedType) -> ()
    typealias DidFailCallback = (_ error: Error) -> ()
    
    fileprivate let request: RequestResource
    fileprivate let didSuccessCallback: DidSuccessCallback
    fileprivate let didFailCallback: DidFailCallback
    
    init(request: RequestResource, didSuccessResourceCallback: @escaping DidSuccessCallback, didFailResourceCallback: @escaping DidFailCallback) {
        self.request = request
        self.didSuccessCallback = didSuccessResourceCallback
        self.didFailCallback = didFailResourceCallback
        super.init()
    }
    
    override public func execute() {
        request.sendRequest(success: { (result: RequestResource.ParsedType) in
            self.didSuccessCallback(result)
        }, failure: { error in
            self.didFailCallback(error)
        })
    }
}
