//
//  HomeView.swift
//  Walletly
//
//  Created by Gokhan Kaya on 8.11.2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewViewModel()
    var selectionVakue : String = ""
    var body: some View {
        NavigationStack{
            GeometryReader{geometry in
                VStack{
//                Total balance section
                    TotalBalanceView(geometry: geometry)

//                  Statistics Section
                    StatisticsSection()
                    
//                    Recent Transactions Text
                    HStack {
                        Text("Recent Transactions")
                            .modifier(BoldMediumTitle())
                        Spacer()
                        NavigationLink(destination:Text("fgdgahdafh")){
                            Text("View all")
                                .foregroundStyle(.gray)
                                .modifier(MediumNormalTitle())
                        }
                    }.padding(.vertical,ProjectPaddings.Vertical.extraSmall.rawValue)
                    
//                    Recent Transactions List
                    
                        
                    
                    
                    
                    
                    Spacer()
                }.padding()            }
        }
    }
}

#Preview {
    HomeView().ignoresSafeArea()
}

struct TotalBalanceView: View {
    var geometry : GeometryProxy
    var body: some View {
        VStack{
            //                        Total balance text and Eye icon
            HStack{
                VStack(alignment: .leading){
                    Text(LocalKeys.Auth.totalBalance.rawValue.locale())
                        .modifier(BoldLargeTitle())
                }
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "eye")
                        .foregroundColor(.white)
                }
            }.padding()
            
//                            Total balance value
            HStack{
                Text("$ 25.0000")
                    .modifier(BoldLargeTitle())
                    .multilineTextAlignment(.leading)
                Spacer()
            }.padding(.horizontal).aspectRatio(contentMode: .fit)
            
            
//                            Add new expence or income button
            HStack{
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "plus.circle.fill").resizable().frame(width: geometry.dw(width: 0.09),height: geometry.dh(height: 0.05)).foregroundColor(Color.white)
                }
            }.padding()
        }.background(LinearGradient(gradient: Gradient(colors: [.iceland_poppy,.heating_lamp]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
    }
}

struct StatisticsSection: View {
    var body: some View {
        
        VStack {
//                    Statistics Text
            HStack(){
                Text("Statistics")
                    .modifier(BoldMediumTitle())
                
                Spacer()
            }.padding(.vertical,ProjectPaddings.Vertical.extraSmall.rawValue)
            HStack{
                NavigationLink(destination: Text("gggg")){
                    HStack{
                        VStack(alignment: .center){
                            Text("Income").aspectRatio(contentMode: .fit).modifier(MediumNormalTitle())
                            Text("$ 200.00").multilineTextAlignment(.center).aspectRatio(contentMode: .fit).modifier(BoldMediumTitle())
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }.padding()
                        .background(Color.nude_blue)
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                }
                Spacer(minLength: 70)
                NavigationLink(destination: Text("fdshdfshsd")) {
                    HStack{
                        VStack{
                            Text("Expense").aspectRatio(contentMode: .fit).modifier(MediumNormalTitle())
                            Text("$ 200.00").multilineTextAlignment(.center).aspectRatio(contentMode: .fit).modifier(BoldMediumTitle())
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }.padding()
                        .background(Color.heating_lamp)
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                }
                
            }
        }
    }
}
