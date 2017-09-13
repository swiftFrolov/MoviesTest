//
//  MovieListControllerTableDataSource.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import UIKit

class MovieListControllerTableDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    init(withTableView tableView: UITableView) {
        tableView.register(MovieListControllerTableContrainerCell.self, forCellReuseIdentifier: "tableViewContainerCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = tableView.frame.height / 2 - 20
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewContainerCell", for: indexPath)
        return cell
    }
}
