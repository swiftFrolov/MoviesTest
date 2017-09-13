//
//  MovieListControllerTableDataSource.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import UIKit

enum MovieListType: Int {
    case new
    case popular
    case rated
    
    static var allTypes: [MovieListType] {
        return [.new, .popular, .rated]
    }
    
    var name: String {
        switch self {
        case .new:
            return "New In Theatres"
        case .popular:
            return "Popular"
        case .rated:
            return "Highest Rated This Year"
        }
    }
}

class MovieListControllerTableDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    let newMovies: Dynamic<[Movie]>
    let highestRatedMovies: Dynamic<[Movie]>
    let popularMovies: Dynamic<[Movie]>
    
    init(withTableView tableView: UITableView, newMovies: Dynamic<[Movie]>, highestRatedMovies: Dynamic<[Movie]>, popularMovies: Dynamic<[Movie]>) {
        tableView.register(MovieListControllerTableContrainerCell.self, forCellReuseIdentifier: "MovieListControllerTableContainerCell")
        self.newMovies = newMovies
        self.highestRatedMovies = highestRatedMovies
        self.popularMovies = popularMovies
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MovieListType.allTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let headerHeight = tableView.tableHeaderView?.frame.height ?? 0
        let height = (tableView.frame.height - headerHeight) / 2 - 5
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listType = MovieListType(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        var movies: Dynamic<[Movie]>
        switch listType {
        case .new:
            movies = newMovies
        case .popular:
            movies = popularMovies
        case .rated:
            movies = highestRatedMovies
        }
        
        let cell = MovieListControllerTableContrainerCell(style: .default, reuseIdentifier: "MovieListControllerTableContainerCell", movies: movies, forListType: listType)
        return cell
    }
}
