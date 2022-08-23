//
//  UpcomingTicketsWidget.swift
//  ExampleWidget
//
//  Created by Indra Tirta Nugraha on 16/08/22.
//

import WidgetKit
import SwiftUI
import LearnWidgetShared

@main
struct UpcomingTicketsWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: LearnWidgetKind.upcomingTickets.rawValue,
            provider: UpcomingTicketsProvider()
        ) { entry in
            UpcomingTicketsEntryView(entry: entry)
        }
        .configurationDisplayName("Upcoming tickets")
        .description("Get to know your upcoming tickets!")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
