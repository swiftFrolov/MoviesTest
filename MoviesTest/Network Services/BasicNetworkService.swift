//
//  BasicNetworkService.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import Foundation

class BasicNetworkService {
    var serviceURL: String {
        return Credentials.baseURL + path + "?" + "api_key=" + Credentials.apiKey
    }
    
    let path: String
    
    init(path: String) {
        self.path = path
    }
}
