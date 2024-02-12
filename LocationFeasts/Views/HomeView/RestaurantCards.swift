//
//  RestaurantCards.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 10.02.2024.
//

import SwiftUI
import Kingfisher

struct RestaurantCards: View {
    var restaurantName : String = "The Halal Guys"
    var imageUrl : String = "https://s3-media1.fl.yelpcdn.com/bphoto/MYnXprCKOS0JlpQJRMOR7Q/o.jpg"
    var rating : Double = 4.5
    var body: some View {
            VStack(alignment: .center){
                
                KFImage(URL(string: imageUrl)).resizable().resizable().frame(width: UIScreen.main.bounds.width*0.3,height: UIScreen.main.bounds.height*0.15).clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))
                    .padding(.bottom,ProjectPaddings.small.rawValue)
                    .padding(.horizontal,ProjectPaddings.large.rawValue)
                    .padding(.top,ProjectPaddings.large.rawValue)
                Text(restaurantName).modifier(DisplayMediumBold()).foregroundStyle(Color.averlandSunset).multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width*0.3,height: UIScreen.main.bounds.height*0.07)
                
                HStack(alignment: .center) {
                    Image(systemName: "star")
                        .resizable()
                        .foregroundStyle(Color.scareubusSacer)
                        .frame(width: UIScreen.main.bounds.width*0.036,height: UIScreen.main.bounds.height*0.015)
                        .padding(.trailing,-5)
                    Text(String(format: "%.1f", rating)).foregroundStyle(Color.scareubusSacer).modifier(DisplayMediumRegular())
                        
                }.padding(.bottom,ProjectPaddings.large.rawValue)
           
            }.background(Color.nero)
            .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))
           
        
    }
}

#Preview {
    RestaurantCards()
}
