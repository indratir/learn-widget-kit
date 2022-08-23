//
//  UpcomingTicketEntry.swift
//  LearnWidgetKit
//
//  Created by Indra Tirta Nugraha on 16/08/22.
//

import Foundation
import WidgetKit
import LearnWidgetShared

struct UpcomingTicketEntry: TimelineEntry {
    let date: Date
    let orderId: String
    let title: String
    let subtitle: String
    let orderType: String
    let iconSystemName: String
    
    var url: URL? {
        .init(string: "widget-url://\(orderId)")
    }
    
    static func placeholder() -> UpcomingTicketEntry {
        .init(
            date: .init(),
            orderId: "",
            title: "There's no upcoming tickets",
            subtitle: "Let's plan your trip with tiket.com!",
            orderType: "✈️ 🏨 🚈 🚐 🚗 🎫",
            iconSystemName: ""
        )
    }
    
    static func snapshot() -> UpcomingTicketEntry {
        .init(
            date: .init(),
            orderId: "",
            title: "Jakarta - Surabaya",
            subtitle: "Tiket Air • ID 9999",
            orderType: "Flight",
            iconSystemName: "airplane.circle.fill"
        )
    }
}

extension Order {
    func toUpcomingTicket() -> UpcomingTicketEntry {
        var orderDate: Date = Date()
        if let dateWrapped = self.date {
            orderDate = dateWrapped
        }
        
        var title: String = ""
        if let titleWrapped = self.title {
            title = titleWrapped
        }
        
        var subtitle: String = ""
        if let subtitleWrapped = self.desc {
            subtitle = subtitleWrapped
        }
        
        var orderType: String = "-"
        var iconSystemName: String = "applelogo"
        
        if let type = self.type {
            orderType = type.name
            iconSystemName = type.iconSystemName
        }
        
        var orderId: String = ""
        if let id = self.id {
            orderId = id
        }
        
        return .init(
            date: orderDate,
            orderId: orderId,
            title: title,
            subtitle: subtitle,
            orderType: orderType,
            iconSystemName: iconSystemName
        )
    }
}
