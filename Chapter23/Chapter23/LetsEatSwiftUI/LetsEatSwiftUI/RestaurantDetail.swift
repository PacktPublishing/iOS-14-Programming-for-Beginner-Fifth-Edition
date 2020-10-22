//
//  RestaurantDetail.swift
//  LetsEatSwiftUI
//
//  Created by iOS 14 Programming on 19/10/2020.
//

import SwiftUI

struct RestaurantDetail: View {
    var selectedRestaurant: RestaurantItem
    var body: some View {
        VStack {
            MapView(lat: selectedRestaurant.lat, long: selectedRestaurant.long).frame(height: 250)
            VStack(alignment: .leading) {
                Text(selectedRestaurant.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(selectedRestaurant.subtitle)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text(selectedRestaurant.address)
                    .font(.headline)
                Text(selectedRestaurant.city)
                    .font(.headline)
            }.padding()
            Spacer()
        }
    }
}

struct RestaurantDetail_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetail(selectedRestaurant: testData[0])
    }
}
