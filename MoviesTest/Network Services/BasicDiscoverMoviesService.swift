//
//  BasicDiscoverMoviesService.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import Foundation

class BasicDiscoverMoviesService: BasicNetworkService {
    private struct DiscoverMoviesResponse: Codable {
        let results: [Movie]
    }
    
    init() {
        super.init(path: "/discover/movie")
    }
    
    func getMovies(completionHandler: @escaping ([Movie]?, Error?) -> Void) {
        fatalError("Must be overridden")
    }
    
    func decodedMoviesFromData(data: Data) -> [Movie]? {
        let decoder = JSONDecoder()
        let result = try? decoder.decode(DiscoverMoviesResponse.self, from: data).results
        guard let movies = result else { return nil }
        return movies.filter { $0.posterURL != nil }
    }
}
