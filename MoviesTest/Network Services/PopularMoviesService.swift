//
//  PopularMoviesService.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import Foundation

class PopularMoviesService: BasicDiscoverMoviesService {
    override func getMovies(completionHandler: @escaping ([Movie]?, Error?) -> Void) {
        let parameters = ["sort_by" : "popularity.desc"]
        NetworkClient().makeRequest(forURL: serviceURL, withParameters: parameters) { response in
            switch response {
            case .failure(let error):
                completionHandler(nil, error)
            case .success(let data):
                guard let movies = self.decodedMoviesFromData(data: data) else {
                    completionHandler(nil, NetworkError.unknown)
                    return
                }
                completionHandler(movies, nil)
            }
        }
    }
}
