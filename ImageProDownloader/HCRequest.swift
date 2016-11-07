//
//  HCAPI.swift
//  ImageProDownloader
//
//  Created by Cuong Nguyen on 06/11/2016.
//  Copyright © 2016 Cuong Nguyen. All rights reserved.
//

import UIKit

final class HCRequest: NSObject, Request, JSONConstructableRequest, SendableRequest, JSONParsing {
    typealias JSONType = Photo
    
    var requestURL: URL?
    var downloadProgress: Float = 0
    
    var session: URLSession {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        return session
    }
    
    init(url: String){
        self.requestURL = URL(string: url)
    }
}

extension HCRequest: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        //
        print("gjgjhg")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        // self.progress
        self.downloadProgress = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        print("Progress: \(self.downloadProgress)")
    }
}

final class ZipRequest: NSObject, Request, JSONConstructableRequest, SendableRequest, JSONParsing {
    typealias JSONType = Archive
    
    var requestURL: URL?
    var downloadProgress: Float = 0
    var session: URLSession {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        return session
    }
    
    init(url: String){
        self.requestURL = URL(string: url)
    }
}
extension ZipRequest: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        //
        print("gjgjhg")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        // self.progress
        self.downloadProgress = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        print("Progress: \(self.downloadProgress)")
    }
}

