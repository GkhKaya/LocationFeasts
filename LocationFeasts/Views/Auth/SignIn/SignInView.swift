//
//  SignInView.swift
//  Walletly
//
//  Created by Gokhan Kaya on 4.10.2023.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject private var viewModel = SignInViewViewModel()
    @Binding var showMainAuthView  : Bool
    @State var email = ""
    @State var password = ""
    @State var nav = false
    var body: some View {
        NavigationStack{
            GeometryReader{geometry in
                VStack{
                    HStack() {
                        Spacer()
                        Image(ProjectImages.GeneralImages.walletlyLogo.rawValue)
                            .resizable()
                            .frame(width: geometry.dw(width: 0.38),height: geometry.dh(height: 0.1))
                        Spacer()
                    }.padding(.top,ProjectPaddings.Top.hugeLarge.rawValue)
                    
                    Text(LocalKeys.Auth.pleaseEnterYourEmailAndPasswordForSignInToWalletly.rawValue.locale())
                        .modifier(BoldNormalTitle())
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                    
                    //                Text fields
                    VStack(spacing: 30){
                        HTextField(hint: LocalKeys.Auth.email.rawValue.locale(), iconName: "envelope.fill", text: $viewModel.email).textInputAutocapitalization(.never)
                        
                        HSecureTextField(hint: LocalKeys.Auth.password.rawValue.locale(), iconName: "lock.fill", text: $viewModel.password)
                    }.padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                    
                    //                Sign in button
                    NormalButton(onTap: {
                        Task{
                            do{
                                try await viewModel.signIn()
                                showMainAuthView = false
                            }catch{
                                print(error)
                            }
                        }
                    }, title: LocalKeys.Auth.signIn.rawValue)
                    .padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                    
                    //                Forgot Password
                    
                    NavigationLink(destination: RecoverPasswordView()) {
                        Text(LocalKeys.Auth.forgotPassword.rawValue.locale())
                            .modifier(BoldNormalTitle())
                            .padding(.top,ProjectPaddings.Top.small.rawValue)
                    }
                    Spacer()
                }.padding()
               
            }.ignoresSafeArea()
                .navigationDestination(isPresented: $viewModel.isExist){
                    TabBar(showMainAuthView: $showMainAuthView)
                }
            
        }
        
        
    }
}

    
    
#Preview{
    SignInView(showMainAuthView: .constant(false)).ignoresSafeArea()
}


