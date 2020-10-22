//
//  LetsEatWidget.swift
//  LetsEatWidget
//
//  Created by iOS 14 Programming on 20/10/2020.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), restaurantTitle: "LetsEat", restaurantSubtitle: "")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), restaurantTitle: "LetsEat", restaurantSubtitle: "")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        var restaurantItems: [RestaurantItem] = []
        let manager = MapDataManager()
        manager.fetch{ (annotations) in restaurantItems = annotations
        }
        for minuteOffset in 0 ..< restaurantItems.count {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset * 5, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, restaurantTitle: restaurantItems[minuteOffset].title!, restaurantSubtitle: restaurantItems[minuteOffset].subtitle!)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    var restaurantTitle: String
    var restaurantSubtitle: String
}

struct LetsEatWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color(.darkGray)
            VStack {
                Text(entry.restaurantTitle)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .minimumScaleFactor(0.5)
                Text(entry.restaurantSubtitle)
                    .font(.body)
                    .foregroundColor(.gray)
                    .bold()
                    .minimumScaleFactor(0.5)
            }.padding()
        }
        
    }
}

@main
struct LetsEatWidget: Widget {
    let kind: String = "LetsEatWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            LetsEatWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("LetsEatWidget")
        .description("This widget shows you restaurants in your area.")
    }
}

struct LetsEatWidget_Previews: PreviewProvider {
    static var previews: some View {
        LetsEatWidgetEntryView(entry: SimpleEntry(date: Date(), restaurantTitle: "The Tap Trailhouse", restaurantSubtitle: "Brewery, Burgers, American"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
