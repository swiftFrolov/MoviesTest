//
//  MovieListControllerTableContainerCellCollectionMovieCellViewModel.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import Foundation

struct MovieListControllerTableContainerCellCollectionMovieCellViewModel {
    let model: Movie
    
    init(withMovieModel model: Movie) {
        self.model = model
    }
    
    var movieName: String {
        return model.title
    }
    
    var posterURL: URL? {
        guard let posterURL = model.posterURL else { return nil }
        let fullPath = "https://image.tmdb.org/t/p/w370_and_h556_bestv2/" + posterURL
        return URL(string: fullPath)
    }
}
