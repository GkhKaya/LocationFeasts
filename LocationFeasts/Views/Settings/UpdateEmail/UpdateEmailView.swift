//
//  UpdateEmailView.swift
//  Walletly
//
//  Created by Gokhan Kaya on 21.10.2023.
//

import SwiftUI

struct UpdateEmailView: View {
    @ObservedObject private var viewModel = UpdateEmailViewViewModel()
    var body: some View {
        NavigationStack{
            GeometryReader{geometry in
                VStack(){
                    

//                    Logo
                    HStack{
                        Spacer()
                        Image(ProjectImages.GeneralImages.walletlyLogo.rawValue)
                            .resizable()
                            .frame(width: geometry.dw(width: 0.38),height: geometry.dh(height: 0.1))
                            .padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                        Spacer()
                    }
//                    Text
                    Text(LocalKeys.Settings.pleaseEnterYourEmailAccountToUpdateYourEmail.rawValue.locale())
                        .modifier(BoldNormalTitle())
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                    
//                    Field
                    HTextField(hint: LocalKeys.Auth.email.rawValue.locale(), iconName: "envelope.fill", text: $viewModel.email)
                        .padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                        .textInputAutocapitalization(.never)
    
//                    Button
                    NormalButton(onTap: {
                        Task{
                            do{
                                try await viewModel.updateEmail()
                            }catch{
                                print(error)
                            }
                        }
                    }, title: LocalKeys.Settings.update.rawValue)
                    .padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                    
                    Spacer()
                    
                    
                }.padding()
            }.navigationTitle("Update Email")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    UpdateEmailView()
}
