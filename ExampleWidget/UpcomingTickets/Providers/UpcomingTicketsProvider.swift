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
    
    func placeholder(in context: Context) -> UpcomingTicketsEntry {
        UpcomingTicketsEntry.placeholder()
    }

    func getSnapshot(in context: Context, completion: @escaping (UpcomingTicketsEntry) -> ()) {
        let entry = UpcomingTicketsEntry.snapshot()
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<UpcomingTicketsEntry>) -> ()) {
        var entries: [UpcomingTicketsEntry] = []
        if let latestOrder = orderInteractor.getMyOrders().last?.toSimpleEntry() {
            entries.append(latestOrder)
        } else {
            entries.append(.placeholder())
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
