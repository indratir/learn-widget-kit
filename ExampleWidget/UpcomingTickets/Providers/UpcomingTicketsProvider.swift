//
//  UpcomingTicketsProvider.swift
//  ExampleWidgetExtension
//
//  Created by Indra Tirta Nugraha on 16/08/22.
//

import Foundation
import WidgetKit
import LearnWidgetShared

struct UpcomingTicketsProvider: TimelineProvider {
    
    private let orderInteractor: OrderInteractor = .init()
    
    func placeholder(in context: Context) -> UpcomingTicketEntry {
        UpcomingTicketEntry.placeholder()
    }

    func getSnapshot(in context: Context, completion: @escaping (UpcomingTicketEntry) -> ()) {
        var entry: UpcomingTicketEntry = .snapshot()
        
        if !context.isPreview,
           let latestOrder = loadUpcomingTickets().first {
            entry = latestOrder
        }
        
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<UpcomingTicketEntry>) -> ()) {
        var entries: [UpcomingTicketEntry] = loadUpcomingTickets()
        if entries.isEmpty {
            entries.append(.placeholder())
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    private func loadUpcomingTickets() -> [UpcomingTicketEntry] {
        return orderInteractor.getUpcomingTickets()
            .map { $0.toUpcomingTicket() }
    }
}
