//
//  Parser.swift
//  ImageProDownloader
//
//  Created by Cuong Nguyen on 06/11/2016.
//  Copyright © 2016 Cuong Nguyen. All rights reserved.
//

import UIKit

protocol ResultParsing {
    associatedtype ParsedType
    func parseData(urlString: String) -> ParsedType?
}

protocol StringParsing: ResultParsing { }

extension StringParsing {
    func parseData(data: Data) -> String? {
        return NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue) as? String
    }
}

protocol JSONConstructable {
    static func fromURLString(urlString: String) -> Self?
}

protocol JSONParsing: ResultParsing {
    associatedtype JSONType: JSONConstructable
    func parseData(urlString: String) -> JSONType?
}

extension JSONParsing {
    func parseData(urlString: String) -> JSONType? {
        return JSONType.fromURLString(urlString: urlString)
    }
}

