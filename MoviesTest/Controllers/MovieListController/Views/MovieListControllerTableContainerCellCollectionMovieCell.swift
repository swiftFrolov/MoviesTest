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
        lbl.text = "Movie Name"
        return lbl
    }()
    
    var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(movieName)
        movieName.setAnchor(top: topAnchor, paddingTop: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, bottom: nil, paddingBottom: 0, width: 0, height: 29)
        
        addSubview(movieImageView)
        movieImageView.setAnchor(top: movieName.bottomAnchor, paddingTop: 5, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, bottom: bottomAnchor, paddingBottom: 0, width: 0, height: 0)
        movieImageView.image = #imageLiteral(resourceName: "dunkirk")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
