//
//  NewMoviesService.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import Foundation

class NewMoviesService: BasicDiscoverMoviesService {
    
    override func getMovies(completionHandler: @escaping ([Movie]?, Error?) -> Void) {
        guard let fromDate = Calendar.current.date(byAdding: .day, value: -30, to: Date()) else { return }
        let fromDateString = fromDate.fullString
        let tillDayString = Date().fullString
        let parameters = ["sort_by" : "primary_release_date.desc", "primary_release_date.gte" : fromDateString, "primary_release_date.lte" : tillDayString]
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
