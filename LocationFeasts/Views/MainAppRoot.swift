//
//  MainAppRoot.swift
//  Walletly
//
//  Created by Gokhan Kaya on 8.12.2023.
//

import SwiftUI

struct MainAppRoot: View {
    @State private var showMainAuthView: Bool = false
    var body: some View {
        ZStack{
            if !showMainAuthView{
                TabBar(showMainAuthView: $showMainAuthView)
            }
        }
        .onAppear{
            let authUser = try? AuthManager.shared.getAuthenticatedUser()
            self.showMainAuthView = authUser == nil
        }.fullScreenCover(isPresented: $showMainAuthView) {
            NavigationStack{
                MainAuthView(showMainAuthView: $showMainAuthView)
            }
        }
    }
}

#Preview {
    MainAppRoot()
}
