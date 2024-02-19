//
//  MapView.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 19.02.2024.
//

import SwiftUI
import MapKit
import Kingfisher
struct MapView: View {
    var imageUrl: String
    var restaurantName: String
    var adress1,adress2,adress3 : String?
    var latitude : Double
    var longitude: Double
    var body: some View {
        //        GeometryReader {geometry in
        ZStack{
            Map(initialPosition: MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), latitudinalMeters: 10, longitudinalMeters: 100))){
                Annotation(restaurantName,coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)){
                    ZStack {
                        Circle().frame(width: 30,height: 30)
                            .foregroundStyle(Color.averlandSunset.opacity(0.5))
                                             
                        Circle().frame(width: 20,height: 20).foregroundStyle(.white.opacity(0.6))
                            
                        Circle().frame(width: 10,height: 10)
                            .foregroundStyle(Color.averlandSunset.opacity(0.8))
                    }
                }
                
            }.mapControls {
                MapCompass()
                MapPitchToggle()
                MapUserLocationButton()
            }
            
            VStack {
                Spacer()
                
                HStack {
                    KFImage(URL(string: imageUrl))
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.12)
                        .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))
                        .padding(.trailing, ProjectPaddings.normal.rawValue)
                        .padding(.leading, ProjectPaddings.normal.rawValue)
                        .padding(.vertical, ProjectPaddings.normal.rawValue)
                    
                    VStack(alignment: .leading) {
                        Text(restaurantName)
                            .modifier(DisplayLargeBold())
                            .padding(.bottom, ProjectPaddings.small.rawValue)
                        Text("\(adress1 ?? "") \(adress2 ?? "") \(adress3 ?? "")")
                            .modifier(DisplayMediumRegular())
                            .foregroundStyle(Color.scareubusSacer)
                    }
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width * 0.94)
                .background(Color.neroo)
                .clipShape(RoundedRectangle(cornerRadius: ProjectPaddings.normal.rawValue))
            }.padding(.all,ProjectPaddings.normal.rawValue)
        }
        //        }
    }
}


#Preview {
    MapView(imageUrl: "https://s3-media2.fl.yelpcdn.com/bphoto/AolQ5hOjkX4H9s2hGxUO5g/o.jpg", restaurantName: "Dürümzade",adress1: "Hüseyinağa Mah.",adress2: "Kamer Hatun Cad. No:26/A",adress3: nil,latitude: 41.0354820142242,longitude: 28.9772715595245)
}
