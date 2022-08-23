//
//  UpcomingTicketsSmallView.swift
//  ExampleWidgetExtension
//
//  Created by Indra Tirta Nugraha on 22/08/22.
//

import SwiftUI
import WidgetKit

struct UpcomingTicketsSmallView: View {
    var entry: UpcomingTicketEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            if !entry.iconSystemName.isEmpty && !entry.orderType.isEmpty {
                HStack {
                    Image(systemName: entry.iconSystemName)
                        .foregroundColor(.accentColor)
                        .frame(width: 24.0, height: 24.0)
                    
                    Text(entry.orderType)
                        .font(.callout)
                }
            }
            
            Text(entry.date.toString(format: "dd MMM yyyy HH:mm"))
                .font(.subheadline)
                .foregroundColor(.init(UIColor.secondaryLabel))
            
            Text(entry.title)
                .font(.headline)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .widgetURL(entry.url)
    }
}

struct UpcomingTicketsSmallView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingTicketsSmallView(entry: .snapshot())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
