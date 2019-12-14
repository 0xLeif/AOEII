//
//  API.swift
//  AOEII
//
//  Created by Zach Eriksen on 12/14/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import Foundation
import Combine

extension URLRequest {
    mutating func dataTaskPublish(method: String = "GET", withBody body: Data? = nil) -> URLSession.DataTaskPublisher {
        let headers = [
            "Content-Type": "application/json; charset=utf-8",
            "cache-control": "no-cache",
        ]
        
        httpMethod = method
        allHTTPHeaderFields = headers
        if let body = body {
            httpBody = body
        }
        
        let session = URLSession.shared
        return session.dataTaskPublisher(for: self)
    }
}

extension URL {
    func request(forRoute route: API.Route, withID id: Int? = nil) -> URLRequest {
        guard let id = id else {
            return URLRequest(url: appendingPathComponent("/\(route.rawValue)"),
                              cachePolicy: .useProtocolCachePolicy,
                              timeoutInterval: 10.0)
        }
        return URLRequest(url: appendingPathComponent("/\(route.rawValue)/\(id)"),
                          cachePolicy: .useProtocolCachePolicy,
                          timeoutInterval: 10.0)
    }
}

class API {
    enum Route: String {
        case civilizations
        case units
        case structures
        case technologies
    }
    
    static var instance: API = {
        API()
    }()
    // Configuations
    let path: String = "https://age-of-empires-2-api.herokuapp.com/api/v1/"
    
    // Lazy Variables
    lazy var url: URL = URL(string: path)!
}
