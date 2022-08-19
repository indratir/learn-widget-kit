//
//  Date+Extensions.swift
//  LearnWidgetKit
//
//  Created by Indra Tirta Nugraha on 14/08/22.
//

import Foundation

extension Date {
    public func toString(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
    
    public func addDays(_ day: Int) -> Date {
        if let date = Calendar.current.date(byAdding: .day, value: day, to: self) {
            return date
        }
        
        return .init()
    }
    
    var milliseconds: Int {
        Int((self.timeIntervalSince1970 * 1000).rounded())
    }
}
