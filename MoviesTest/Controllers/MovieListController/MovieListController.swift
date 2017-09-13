//
//  MovieListController.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import UIKit

class MovieListController: UIViewController {
    var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        return tv
    }()
    
    var dataSource: MovieListControllerTableDataSource!
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        dataSource = MovieListControllerTableDataSource(withTableView: tableView)
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.tableHeaderView = MovieListControllerTableHeaderView(frame: CGRect(x: 0, y: 0, width: 0, height: 55))
        
        view.addSubview(tableView)
        tableView.setAnchor(top: view.topAnchor, paddingTop: 28, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, bottom: view.bottomAnchor, paddingBottom: 0, width: 0, height: 0)
    }
}
