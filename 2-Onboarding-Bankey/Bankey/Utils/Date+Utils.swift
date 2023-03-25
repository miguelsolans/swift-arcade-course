//
//  Date+Utils.swift
//  Bankey
//
//  Created by Miguel Solans on 25/03/2023.
//

import Foundation

extension Date {
    
    static var bankeyDateFormatter: DateFormatter {
        let formatter = DateFormatter();
        // Calgary AB, Canada
        formatter.timeZone = TimeZone(abbreviation: "MDT");
        return formatter;
    }
    
    var monthDayYearString: String {
        let dateFormatter = Date.bankeyDateFormatter
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
