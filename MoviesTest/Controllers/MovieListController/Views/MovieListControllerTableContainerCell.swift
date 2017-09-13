//
//  MovieListControllerTableContainerCell.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import UIKit

class MovieListControllerTableContrainerCell: UITableViewCell {
    var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 236, green: 237, blue: 238)
        return view
    }()
    
    var listTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    var listType: MovieListType
    var dataSource: MovieListControllerTableContainerCellCollectionDataSource!
    var movies = Dynamic<[Movie]>([])
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, movies: Dynamic<[Movie]>, forListType listType: MovieListType) {
        self.movies = movies
        self.listType = listType
        listTypeLabel.text = listType.name
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        dataSource = MovieListControllerTableContainerCellCollectionDataSource(withCollectionView: collectionView, movies: movies)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(separatorView)
        separatorView.setAnchor(top: topAnchor, paddingTop: 0, left: leftAnchor, paddingLeft: 17, right: rightAnchor, paddingRight: 17, bottom: nil, paddingBottom: 0, width: 0, height: 2)
        
        addSubview(listTypeLabel)
        listTypeLabel.setAnchor(top: separatorView.bottomAnchor, paddingTop: 16, left: leftAnchor, paddingLeft: 17, right: rightAnchor, paddingRight: 17, bottom: nil, paddingBottom: 0, width: 0, height: 29)
        
        addSubview(collectionView)
        collectionView.delegate = dataSource
        collectionView.dataSource = dataSource
        collectionView.setAnchor(top: listTypeLabel.bottomAnchor, paddingTop: 1, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, bottom: bottomAnchor, paddingBottom: 14, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
