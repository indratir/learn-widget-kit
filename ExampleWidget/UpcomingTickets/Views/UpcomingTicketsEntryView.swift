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
    var entry: UpcomingTicketsEntry
    
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
            
            Text(entry.orderDate)
                .font(.subheadline)
                .foregroundColor(.init(UIColor.secondaryLabel))
            
            Text(entry.title)
                .font(.headline)
            
            Text(entry.subtitle)
                .font(.subheadline)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .widgetURL(entry.url)
    }
}

struct UpcomingTicketsWidget_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingTicketsEntryView(entry: .snapshot())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
