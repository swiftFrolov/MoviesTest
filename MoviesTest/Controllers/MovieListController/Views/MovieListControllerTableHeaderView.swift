//
//  MovieListControllerTableHeaderView.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import UIKit

class MovieListControllerTableHeaderView: UIView {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.text = "Movies"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.setAnchor(top: topAnchor, paddingTop: 0, left: leftAnchor, paddingLeft: 17, right: rightAnchor, paddingRight: 17, bottom: bottomAnchor, paddingBottom: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
