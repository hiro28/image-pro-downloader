//
//  Request.swift
//  ImageProDownloader
//
//  Created by Cuong Nguyen on 06/11/2016.
//  Copyright © 2016 Cuong Nguyen. All rights reserved.
//

import UIKit

protocol Request {
    var requestURL: URL? { get }
    var method: String { get }
    var parameters: Dictionary<String, String> { get }
    var headers: Dictionary<String, String> { get }
    var downloadProgress: Float { get }
}

extension Request {
    var method : String { return "GET" }
    var parameters : Dictionary<String, String> { return Dictionary() }
    var headers : Dictionary<String, String> { return Dictionary() }
}

protocol ConstructableRequest: Request {
    func buildRequest() -> NSURLRequest?
}

protocol JSONConstructableRequest: ConstructableRequest { }
extension JSONConstructableRequest {
    func buildRequest() -> NSURLRequest? {
        guard let aRequestURL = requestURL else { return nil }
        
        let request = NSMutableURLRequest(url: aRequestURL)
        if method != "GET" {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        request.httpMethod = method
        return request
    }
}

protocol SendableRequest: ConstructableRequest, ResultParsing {
    var session: URLSession { get }
}
extension SendableRequest {
    func sendRequest(success: @escaping (_ result: ParsedType) -> (), failure: @escaping (_ error: Error) -> ()) {
        let session = URLSession.shared
        guard let request = buildRequest() else { return }
        
        //        let task = session.dataTask(with: request as URLRequest)
        //let task = session.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        let task = session.downloadTask(with: request as URLRequest, completionHandler: { (url, taskResponse, taskError) -> Void in

            if let taskError = taskError {
                failure (taskError)
            } else if let url = url {
                
                if let originalURL = request.url?.absoluteString, let destinationURL = localFilePathForUrl(previewUrl: originalURL) {
                    
                    // 2
                    let fileManager = FileManager.default
                    do {
                        try fileManager.removeItem(at: destinationURL)
                    } catch {
                        // Non-fatal: file probably doesn't exist
                    }
                    do {
                        try fileManager.copyItem(at: url, to: destinationURL)
                        
                        guard let result = self.parseData(urlString: destinationURL.path) else { return }
                        print(result)
                        success(result)
                        
                    } catch let error as NSError {
                        print("Could not copy file to disk: \(error.localizedDescription)")
                    }
                }
            }
        })
        task.resume()
    }
}

func localFilePathForUrl(previewUrl: String) -> URL? {
    let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
    if let url = URL(string: previewUrl) {
        let lastPathComponent = url.lastPathComponent
        let fullPath = documentsPath.appendingPathComponent(lastPathComponent)
        return URL(fileURLWithPath:fullPath)
    }
    return nil
}
