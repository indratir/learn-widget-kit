//
//  Order.swift
//  LearnWidgetKit
//
//  Created by Indra Tirta Nugraha on 14/08/22.
//

import Foundation

public struct Order: Comparable {    
    public let id: String?
    public let title: String?
    public let date: Date?
    public let type: OrderType?
    public let desc: String?
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        guard
            let lhsDate = lhs.date,
            let rhsDate = rhs.date
        else { return false }
        
        return lhsDate < rhsDate
    }
}

extension OrderRepositoryParam {
    func toOrder() -> Order {
        var orderType: OrderType?
        
        if let type = self.type {
            orderType = .init(rawValue: type)
        }
        
        return .init(
            id: self.id,
            title: self.title,
            date: self.date?.toDateTime(),
            type: orderType,
            desc: self.desc
        )
    }
}
