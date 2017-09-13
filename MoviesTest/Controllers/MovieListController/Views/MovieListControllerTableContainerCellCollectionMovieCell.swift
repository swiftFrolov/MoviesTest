//
//  MovieListControllerTableContainerCellCollectionMovieCell.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import UIKit

class MovieListControllerTableContainerCellCollectionMovieCell: UICollectionViewCell {
    var movieName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 24, weight: .light)
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private var posterURL: URL?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(movieName)
        movieName.setAnchor(top: topAnchor, paddingTop: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, bottom: nil, paddingBottom: 0, width: 0, height: 29)
        
        addSubview(movieImageView)
        movieImageView.setAnchor(top: movieName.bottomAnchor, paddingTop: 5, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, bottom: bottomAnchor, paddingBottom: 0, width: 0, height: 0)
        movieImageView.image = #imageLiteral(resourceName: "dunkirk")
    }
    
    func configure(withViewModel viewModel: MovieListControllerTableContainerCellCollectionMovieCellViewModel) {
        movieImageView.image = nil
        movieName.text = viewModel.movieName
        posterURL = viewModel.posterURL
        if let posterURL = posterURL {
            URLSession.shared.dataTask(with: posterURL, completionHandler: { data, response, error in
                guard let data = data else { return }
                guard let lastURL = self.posterURL?.absoluteString, lastURL == response?.url?.absoluteString else { return }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.movieImageView.image = image
                }
            }).resume()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
