//
//  HomeView.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 7.02.2024.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var vm = HomeViewViewModel()
  var body: some View {
    NavigationStack {
      GeometryReader { geometry in
        ScrollView {
          VStack {
            //                        Title
            TitleSub(geometry: geometry)

            //                        Search Bar
            HStack {
              HStack {
                
                Image(systemName: "magnifyingglass")
                  .resizable()
                  .frame(width: geometry.dw(width: 0.06), height: geometry.dh(height: 0.03))
                  .padding(.all, 12)
                  
                  
                TextField(
                    LocalKeys.Home.whichFoodDoYouWantToFind.rawValue.locale(), text: $vm.terms).keyboardType(.default).textInputAutocapitalization(.never)
              }
              .background(Color.nero)
              .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))
              .padding(.trailing, ProjectPaddings.normal.rawValue)

              Image(systemName: "location.fill")
                .resizable()
                .tint(.white)
                .frame(width: geometry.dw(width: 0.06), height: geometry.dh(height: 0.03))
            }
            .padding(.top, ProjectPaddings.large.rawValue)

            //                        Ad Area
            AdAreaSub(geometry: geometry)

            //                        Cheap Restorants
            VStack {
              HStack {
                Text(LocalKeys.Home.cheapRestaurant.rawValue.locale())
                  .modifier(DisplayLargeRegular())
                Spacer()
              }

              HStack {

              }
            }.padding(.top, ProjectPaddings.normal.rawValue)

            //                        Medium Priced Restaurant
            VStack {
              HStack {
                Text(LocalKeys.Home.mediumPricedRestaurant.rawValue.locale())
                  .modifier(DisplayLargeRegular())
                Spacer()
              }

              HStack {

              }
            }.padding(.top, ProjectPaddings.normal.rawValue)

//                        Expensive Restaurant
            VStack {
              HStack {
                  Text(LocalKeys.Home.expensiveRestaurant.rawValue.locale())
                  .modifier(DisplayLargeRegular())
                Spacer()
              }

              HStack {

              }
            }.padding(.top, ProjectPaddings.normal.rawValue)

          }.padding(.horizontal, ProjectPaddings.normal.rawValue)

        }
      }
    }
  }
}

#Preview{
  HomeView()
}

struct TitleSub: View {
  var geometry: GeometryProxy
  var body: some View {
    HStack {
      Text(LocalKeys.Home.findNearbyRestaurants.rawValue.locale())
        .modifier(DisplayLargeBlack())
        .multilineTextAlignment(.leading)
      Spacer()
      NavigationLink {
        ContentView()
      } label: {
        Image(systemName: "gear")
          .resizable()
          .tint(.white)
          .frame(width: geometry.dw(width: 0.08), height: geometry.dh(height: 0.04))
      }
    }.padding(.vertical, ProjectPaddings.extraSmall.rawValue)
  }
}

struct AdAreaSub: View {
  var geometry: GeometryProxy
  var body: some View {
    ZStack {
      Rectangle()
        .frame(width: geometry.dw(width: 0.9), height: geometry.dh(height: 0.25))
        .foregroundStyle(Color.nero).opacity(0.5)
        .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))

      Text("Ad Area")
        .modifier(DisplayLargeBlack())
    }.padding(.top, ProjectPaddings.normal.rawValue)
  }
}
