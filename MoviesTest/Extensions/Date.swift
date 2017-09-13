//
//  Date.swift
//  MoviesTest
//
//  Created by Val on 9/14/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import Foundation

extension Date {
    enum DatePart {
        case year
        case month
        case day
    }
    
    var fullString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "GTM")
        return formatter.string(from: self)
    }
    
    func getStringForDatePart(_ datePart: DatePart) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GTM")
        switch datePart {
        case .year:
            formatter.dateFormat = "yyyy"
        case .month:
            formatter.dateFormat = "MM"
        case .day:
            formatter.dateFormat = "dd"
        }
        return formatter.string(from: self)
    }
}
