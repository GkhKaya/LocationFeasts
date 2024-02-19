//
//  DetailView.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 14.02.2024.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    @ObservedObject var vm = DetailViewModel()
    var id : String = "DW2smOPofF5n_ufLxFIlgg"
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView(showsIndicators:false) {
                    VStack(){
                        Spacer()
                        KFImage(URL(string: vm.resultData?.imageURL ?? "")).resizable().frame(width: geometry.dw(width: 0.9),height: geometry.dh(height: 0.4)).clipShape(RoundedRectangle(cornerRadius: ProjectRadius.extraSmall.rawValue))
                        HStack {
                            Text(vm.resultData?.name ?? "")
                                .modifier(DisplayLargeBold())
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Button{
                                vm.goToMap = true
                            }label: {
                                Text("Look Location with Map")
                                    .modifier(DisplayMediumBold())
                                    .foregroundStyle(Color.averlandSunset)
                            }.navigationDestination(isPresented: $vm.goToMap){
                                MapView(imageUrl: vm.resultData?.url ?? "", restaurantName: vm.resultData?.name ?? "", adress1: vm.resultData?.location?.address1 ?? "", adress2: vm.resultData?.location?.address2 ?? "", adress3: vm.resultData?.location?.address3 ?? "", latitude: vm.resultData?.coordinates?.latitude ?? 0.0, longitude: vm.resultData?.coordinates?.longitude ?? 0.0)
                            }
                            
                        }.padding(.top,ProjectPaddings.normal.rawValue)
                        HStack(alignment:.center){
                            
                            Image(systemName: "door.left.hand.closed").resizable().frame(width: geometry.dw(width: 0.06),height: geometry.dh(height: 0.03))
                                .foregroundStyle(Color.grotesqueGreen)
                            
                            vm.resultData?.isClosed == true ?
                            Text("Closed")
                                .padding(.trailing,ProjectPaddings.normal.rawValue)
                                .foregroundStyle(Color.scareubusSacer)
                            :
                            Text("Open")
                                .padding(.trailing,ProjectPaddings.normal.rawValue)
                                .foregroundStyle(Color.scareubusSacer)
                            
                            Image(systemName: "star.fill").resizable().frame(width: geometry.dw(width: 0.06),height: geometry.dh(height: 0.03))
                                .foregroundStyle(Color.grotesqueGreen)
                            
                            Text(String(format: "%.1f", vm.resultData?.rating ?? 0.0))
                                .modifier(DisplayMediumBold())
                                .foregroundStyle(Color.scareubusSacer)
                                .padding(.trailing,ProjectPaddings.normal.rawValue)
                            
                            Image(systemName: "phone.fill").resizable().frame(width: geometry.dw(width: 0.06),height: geometry.dh(height: 0.03))
                                .foregroundStyle(Color.grotesqueGreen)
                            Text(vm.resultData?.displayPhone ?? "")
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color.scareubusSacer)
                                .modifier(DisplayMediumBold())
                            Spacer()
                                
                        }.padding(.top,ProjectPaddings.extraSmall.rawValue)
                        
                        HStack{
                            Text("Categories")
                                .modifier(DisplayLargeBold())
                                Spacer()
                        }.padding(.top,ProjectPaddings.large.rawValue)
                        
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing:20) {
                                Spacer()
                                ForEach(vm.resultData?.categories ?? [], id:\.title?.count){data in
                                    if let categoryTitle = data.title{
                                        DetailCategoryCard(title: categoryTitle)
                                    }else{
                                        Text("Data is not found")
                                    }
                                    Spacer()
                                }
                            }
                        }.padding(.top,ProjectPaddings.small.rawValue)
                        
                        HStack{
                            Text("Photos")
                                .modifier(DisplayLargeBold())
                                Spacer()
                        }.padding(.top,ProjectPaddings.large.rawValue)
                        
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing:15){
                                ForEach(vm.resultData?.photos ?? [], id:\.self){data in
                                    KFImage(URL(string: data)).frame(width: geometry.dw(width: 0.38),height: geometry.dh(height: 0.2)).clipShape(RoundedRectangle(cornerRadius: ProjectRadius.extraSmall.rawValue))
                                }
                            }
                        }.padding(.top,ProjectPaddings.small.rawValue)
                    }
                    .padding(.all,ProjectPaddings.normal.rawValue)
                    .task {
                        await vm.getResultData(id: id)
                }
                }
            }
        }
    }
}

#Preview {
    DetailView()
}
