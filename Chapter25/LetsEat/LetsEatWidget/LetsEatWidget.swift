//
//  LetsEatWidget.swift
//  LetsEatWidget
//
//  Created by iOS 14 Programming on 01/11/2020.
//
#if !targetEnvironment(macCatalyst)
import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), restaurantTitle: "LetsEat", restaurantSubTitle: "")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), restaurantTitle: "LetsEat", restaurantSubTitle: "")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        var restaurantItems: [RestaurantItem] = []
        let manager = MapDataManager()
        manager.fetch{ (annotations) in restaurantItems = annotations}
        for minuteOffset in 0 ..< restaurantItems.count {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset * 5, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, restaurantTitle: restaurantItems[minuteOffset].title!, restaurantSubTitle: restaurantItems[minuteOffset].subtitle!)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    var restaurantTitle: String
    var restaurantSubTitle: String
    
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
                Text(entry.restaurantSubTitle)
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
        LetsEatWidgetEntryView(entry: SimpleEntry(date: Date(), restaurantTitle: "The Tap Trailhouse", restaurantSubTitle: "Brewery, Burgers, American"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
#endif
