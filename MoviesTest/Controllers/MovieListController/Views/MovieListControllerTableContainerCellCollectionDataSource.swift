//
//  MovieListControllerTableContainerCellCollectionDataSource.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import UIKit

class MovieListControllerTableContainerCellCollectionDataSource: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var movies = [Movie]()
    
    init(withCollectionView collectionView: UICollectionView, movies: Dynamic<[Movie]>) {
        super.init()
        collectionView.register(MovieListControllerTableContainerCellCollectionMovieCell.self, forCellWithReuseIdentifier: "MovieListControllerTableContainerCellCollectionMovieCell")
        
        movies.bindAndFire { [weak self] movieArray in
            guard let strongSelf = self else { return }
            strongSelf.movies = movieArray
            DispatchQueue.main.async {
                collectionView.reloadData()
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 34
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 17, 0, 17)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 34, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieListControllerTableContainerCellCollectionMovieCell", for: indexPath) as! MovieListControllerTableContainerCellCollectionMovieCell
        let movie = movies[indexPath.row]
        let viewModel = MovieListControllerTableContainerCellCollectionMovieCellViewModel(withMovieModel: movie)
        cell.configure(withViewModel: viewModel)
        return cell
    }
}
