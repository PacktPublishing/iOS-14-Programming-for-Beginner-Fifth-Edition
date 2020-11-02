//
//  ContentView.swift
//  LetsEatSwiftUI
//
//  Created by iOS 14 Programming on 01/11/2020.
//

import SwiftUI

struct ContentView: View {
    var restaurantItems: [RestaurantItem] = testData
    var body: some View {
        NavigationView{
            List(restaurantItems) { restaurantItem in
                RestaurantCell(restaurantItem: restaurantItem)
            }.navigationTitle("Boston, MA")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(restaurantItems: testData)
    }
}

struct RestaurantCell: View {
    var restaurantItem: RestaurantItem
    var body: some View {
        NavigationLink(
            destination: RestaurantDetail(selectedRestaurant: restaurantItem)){
            Spacer()
            VStack {
                Text(restaurantItem.title)
                    .font(.headline)
                Text(restaurantItem.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Image(restaurantItem.imageName)
            }
            Spacer()
        }
    }
}
