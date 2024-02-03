//
//  ProfileView.swift
//  Walletly
//
//  Created by Gokhan Kaya on 9.12.2023.
//

import SwiftUI

struct ProfileView: View {
    @Binding var showMainAuthView : Bool
    @ObservedObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                
            }.navigationTitle(LocalKeys.ProfileView.profile.rawValue.locale())
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: SettingsView(showMainAuthView: $showMainAuthView)){
                            Image(systemName: "gear")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }.ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        ProfileView(showMainAuthView: .constant(false))
    }
}
