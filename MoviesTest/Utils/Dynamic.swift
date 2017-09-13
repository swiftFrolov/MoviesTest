//
//  Dynamic.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    
    private var listeners: [Listener] = []
    
    var value: T {
        didSet {
            for listener in listeners {
                listener(value)
            }
        }
    }
    
    func bindAndFire(_ listener: @escaping Listener) {
        bind(listener)
        listener(value)
    }
    
    func bind(_ listener: @escaping Listener) {
        listeners.append(listener)
    }
    
    init(_ value: T) {
        self.value = value
    }
}
