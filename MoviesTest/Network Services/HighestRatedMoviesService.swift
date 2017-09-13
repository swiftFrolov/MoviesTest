//
//  HighestRatedMoviesService.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import Foundation

class HighestRatedMoviesService: BasicDiscoverMoviesService {
    
    override func getMovies(completionHandler: @escaping ([Movie]?, Error?) -> Void) {
        let parameters = ["sort_by" : "vote_average.desc", "vote_count.gte" : "500", "primary_release_year" : Date().getStringForDatePart(.year)]
        NetworkClient().makeRequest(forURL: serviceURL, withParameters: parameters) { response in
            switch response {
            case .failure(let error):
                completionHandler(nil, error)
            case .success(let data):
                guard let movies = self.decodedMoviesFromData(data: data) else {
                    completionHandler(nil, NetworkClient.NetworkError.unknown)
                    return
                }
                completionHandler(movies, nil)
            }
        }
    }
}
