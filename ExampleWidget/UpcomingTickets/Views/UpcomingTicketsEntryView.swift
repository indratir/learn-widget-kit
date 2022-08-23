//
//  UpcomingTicketsEntryView.swift
//  LearnWidgetKit
//
//  Created by Indra Tirta Nugraha on 16/08/22.
//

import SwiftUI
import WidgetKit
import LearnWidgetShared

struct UpcomingTicketsEntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: UpcomingTicketEntry
    
    var body: some View {
        switch family {
        case .systemSmall:
            UpcomingTicketsSmallView(entry: entry)
        case .systemMedium:
            UpcomingTicketsMediumView(entry: entry)
        default:
            Text("undefined")
        }
    }
}
