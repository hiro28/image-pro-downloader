//
//  ViewController.swift
//  ImageProDownloader
//
//  Created by Cuong Nguyen on 06/11/2016.
//  Copyright © 2016 Cuong Nguyen. All rights reserved.
//

import UIKit
import Zip

class ViewController: UIViewController {
    
    var tableSource = [Album]()
    
    let operationQueue = OperationQueue()
    
    var data1: [String] = [
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j001.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j002.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j003.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j004.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j005.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j006.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j007.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j008.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j009.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j010.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j011.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j012.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j013.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j014.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j015.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j016.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j017.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j018.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j019.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j020.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j021.jpg",
        "http://mrcdn.info/http://h.mfcdn.net/store/manga/9563/237.0/compressed/j022.jpg"]
    
    var data2: [String] = [
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/3.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/4.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/5.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitalo/es/0/6.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitalo/es/0/7.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitalo/es/0/8.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/9.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/10.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/11.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/12.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/13.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/14.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitalo/es/0/15.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitalo/es/0/16.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitalo/es/0/17.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/18.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitalo/es/0/19.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/20.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/21.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitalo/es/0/22.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/23.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitalo/es/0/24.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/25.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitalo/es/0/26.jpg",
        "http://submanga.org/resources/uploads/manga/boku-wa-kimi-no-shiro/capitulo/es/0/27.jpg"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //        for urlString in data1 {
        //            let request = HCRequest(url: urlString)
        //            let operation = HCOperation(request: request, didSuccessResourceCallback: { (data) in
        //                print(data)
        //            }, didFailResourceCallback: { (error) in
        //                print(error)
        //            })
        //            operationQueue.addOperation(operation)
        //        }
        //
        //        for urlString in data2 {
        //            let request = HCRequest(url: urlString)
        //            let operation = HCOperation(request: request, didSuccessResourceCallback: { (data) in
        //                print(data)
        //            }, didFailResourceCallback: { (error) in
        //                print(error)
        //            })
        //            operationQueue.addOperation(operation)
        //        }
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        let urlString = "https://dl.dropboxusercontent.com/u/4529715/JSON%20files%20updated.zip"
        let request = ZipRequest(url: urlString)
        
        let operation = HCOperation(request: request, didSuccessResourceCallback: { (data) in
            let zipPath = data as Archive
            do {
                if zipPath.urlPath != nil {
                    var documentsDirectory = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)[0]
                    try Zip.unzipFile(zipPath.urlPath!, destination: documentsDirectory, overwrite: true, password: nil, progress: { (progress) -> () in
                        print(progress)
                        if progress == 1.0 {
                            if var fileName = zipPath.urlPath!.lastPathComponent.removingPercentEncoding {
                                fileName = fileName.replacingOccurrences(of: ".zip", with: "")
                                documentsDirectory.appendPathComponent(fileName)
                                
                                let directoryContents = self.handleDownloadJsonFile(documentsDirectory: documentsDirectory)
                                
                                
                            }
                        }
                    })
                }
            }
            catch {
                print("Something went wrong")
            }
        }, didFailResourceCallback: { (error) in
            print(error)
        })
        operationQueue.addOperation(operation)
    }
    
    func handleDownloadJsonFile(documentsDirectory: URL) -> [URL] {
        do {
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil, options: [])
            for jsonName in directoryContents {
                let jsonDirectory = documentsDirectory.appendingPathComponent(jsonName.absoluteString, isDirectory: false)
                //NSData(contentsOfFile: jsonDirectory, options: .DataReadingMappedIfSafe, error: nil)
                if let jsonData = NSData(contentsOfFile: jsonDirectory.path)
                {
                    if let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    {
                        //TODO: Do Stuff
                    }
                }
            }
            
            print(directoryContents)
            return directoryContents
        } catch let error as NSError {
            print(error.localizedDescription)
            return []
        }
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func pauseButtonAction(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
