//
//  MapViewRestaurantInfoCard.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 19.02.2024.
//

import SwiftUI
import Kingfisher

struct MapViewRestaurantInfoCard: View {
    var imageUrl: String
    var restaurantName: String
    var adress1,adress2,adress3 : String?
    var geometry: GeometryProxy
    var body: some View {
        HStack {
            KFImage(URL(string: imageUrl))
                .resizable()
                .frame(width: geometry.dw(width: 0.26),height: geometry.dh(height: 0.13))
            .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))
            .padding(.trailing,ProjectPaddings.normal.rawValue)
            VStack(alignment: .leading) {
                Text(restaurantName)
                    .modifier(DisplayLargeBold())
                    .padding(.bottom,ProjectPaddings.small.rawValue)
                Text("\(adress1 ?? "") \(adress2 ?? "") \(adress3 ?? "")").modifier(DisplayMediumRegular())
                
            }
        }.background(Color.scareubusSacer)
    }
}

//#Preview {
//    MapViewRestaurantInfoCard(imageUrl: "https://s3-media2.fl.yelpcdn.com/bphoto/AolQ5hOjkX4H9s2hGxUO5g/o.jpg", restaurantName: "Dürümzade",adress1: "Hüseyinağa Mah.",adress2: "Kamer Hatun Cad. No:26/A",adress3: nil)
//}
