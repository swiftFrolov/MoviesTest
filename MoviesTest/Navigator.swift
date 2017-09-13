//
//  Navigator.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import UIKit

class Navigator {
    static func loadFirstScreen(window: UIWindow?) {
        guard let window = window else { return }
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        // Load main controller
        loadMovieListController(currentController: navigationController)
    }
    
    static func loadMovieListController(currentController: UIViewController) {
        let vc = MovieListController()
        currentController.show(vc, sender: nil)
    }
}
