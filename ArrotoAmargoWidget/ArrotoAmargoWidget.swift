//
//  ArrotoAmargoWidget.swift
//  ArrotoAmargoWidget
//
//  Created by Rafael Schmitt on 12/08/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct ArrotoAmargoWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color(red: 0.93, green: 0.89, blue: 0.22)
            VStack(alignment: .leading) {
                ImageStore.shared.image(name: "new_england_ipa")
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                    .clipShape(Circle())
                Text("Roleta Russa New England IPA")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.vertical, 1)
                Text("Degustada ontem")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 16)
        }
    }
}

@main
struct ArrotoAmargoWidget: Widget {
    let kind: String = "ArrotoAmargoWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            ArrotoAmargoWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Arroto Amargo")
        .description("Veja um histórico recente das cervejas que você degustou.")
    }
}

struct ArrotoAmargoWidget_Previews: PreviewProvider {
    static var previews: some View {
        ArrotoAmargoWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
