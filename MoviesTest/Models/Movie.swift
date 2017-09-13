//
//  Movie.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let title: String
    let posterURL: String?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case posterURL = "poster_path"
    }
}
