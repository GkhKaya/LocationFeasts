//
//  HomeView.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 7.02.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var isSheetPresented: Bool = false

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
                  LocalKeys.Home.whichFoodDoYouWantToFind.rawValue.locale(), text: $vm.term,
                  onEditingChanged: { isEditing in
                    if !isEditing {
                      Task {
                        await vm.getResultData()
                      }
                    }
                  }, onCommit: {})
              }
              .background(Color.nero)
              .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))
              .padding(.trailing, ProjectPaddings.normal.rawValue)

                Button{
                    isSheetPresented.toggle()
                }label:{
                    Image(systemName: "location.fill")
                      .resizable()
                      .tint(.white)
                      .frame(width: geometry.dw(width: 0.06), height: geometry.dh(height: 0.03))
                }
                .sheet(isPresented: $isSheetPresented) {
                                ContentView()
                            }
              
            }
            .padding(.top, ProjectPaddings.large.rawValue)

            //                        Ad Area
            AdAreaSub(geometry: geometry)

            //                        Cheap Restorants

            HStack {
              Text(LocalKeys.Home.cheapRestaurant.rawValue.locale())
                .modifier(DisplayMediumBold())
              Spacer()
            }.padding(.top, ProjectPaddings.large.rawValue)
            ScrollView(.horizontal) {
              HStack {
                  if let filteredData = vm.resultData?.businesses?.filter({ data in
                      vm.filterData(withCount: 1, price: data.price)
                  }), !filteredData.isEmpty {
                    ForEach(filteredData, id: \.id) { data in
                        NavigationLink(destination: DetailView(id: data.id ?? "")) {
                        RestaurantCards(
                          restaurantName: data.name ?? "",
                          imageUrl: data.imageURL ?? "",
                          rating: data.rating ?? 0.0
                        )
                      }
                    }
                  } else {
                      Text(LocalKeys.Home.restaurantIsNotExist.rawValue.locale())
                  }
              }
            }
            //                        Medium Priced Restorants

            HStack {
              Text(LocalKeys.Home.mediumPricedRestaurant.rawValue.locale())
                .modifier(DisplayMediumBold())
              Spacer()
            }.padding(.top, ProjectPaddings.large.rawValue)
            ScrollView(.horizontal) {
              HStack {
                  if let filteredData = vm.resultData?.businesses?.filter({ data in
                      vm.filterData(withCount: 2, price: data.price)
                  }), !filteredData.isEmpty {
                    ForEach(filteredData, id: \.id) { data in
                        NavigationLink(destination: DetailView(id: data.id ?? "")) {
                        RestaurantCards(
                          restaurantName: data.name ?? "",
                          imageUrl: data.imageURL ?? "",
                          rating: data.rating ?? 0.0
                        )
                      }
                    }
                  } else {
                      Text(LocalKeys.Home.restaurantIsNotExist.rawValue.locale())
                  }
              }
            }

            //                        Expensive Restorants

            HStack {
              Text(LocalKeys.Home.expensiveRestaurant.rawValue.locale())
                .modifier(DisplayMediumBold())
              Spacer()
            }.padding(.top, ProjectPaddings.large.rawValue)
            ScrollView(.horizontal) {
              HStack {
                if let filteredData = vm.resultData?.businesses?.filter { data in
                  vm.filterData(withCount: 3, price: data.price)
                }, !filteredData.isEmpty {
                  ForEach(filteredData, id: \.id) { data in
                    NavigationLink(destination: DetailView(id: data.id ?? "")) {
                      RestaurantCards(
                        restaurantName: data.name ?? "",
                        imageUrl: data.imageURL ?? "",
                        rating: data.rating ?? 0.0
                      )
                    }
                  }
                } else {
                    Text(LocalKeys.Home.restaurantIsNotExist.rawValue.locale())
                }
              }
            }

          }.padding(.horizontal, ProjectPaddings.normal.rawValue)

        }
      }
    }.task {
      await vm.getResultData()
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
