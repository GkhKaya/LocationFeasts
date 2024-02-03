//
//  SignUpView.swift
//  Walletly
//
//  Created by Gokhan Kaya on 5.10.2023.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject private var viewModel = SignUpViewViewModel()
    @Environment(\.colorScheme) var colorScheme
    @Binding var  showMainAuthView : Bool
    var body: some View {
        NavigationStack{
            GeometryReader{geometry in
                VStack{
                    //                Walletly Logo
                    HStack() {
                        Spacer()
                        Image(ProjectImages.GeneralImages.walletlyLogo.rawValue)
                            .resizable()
                            .frame(width: geometry.dw(width: 0.38),height: geometry.dh(height: 0.1))
                        Spacer()
                    }.padding(.top,ProjectPaddings.Top.hugeLarge.rawValue)
                    
                    //                Description Text
                    
                    Text(LocalKeys.Auth.pleaseEnterYourEmailAndPasswordToCreateAccount.rawValue.locale())
                                .modifier(BoldNormalTitle())
                                .foregroundColor(.gray)
                                .padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                                .multilineTextAlignment(.center)
                        
                        
                        //                Text fields
                        VStack(spacing: 30){
                            HTextField(hint: LocalKeys.Auth.email.rawValue.locale(), iconName: "envelope.fill", text: $viewModel.email).textInputAutocapitalization(.never)
                            
                            HSecureTextField(hint: LocalKeys.Auth.password.rawValue.locale(), iconName: "lock.fill", text: $viewModel.password)
                        }.padding(.top,ProjectPaddings.Top.veryLarge.rawValue)
                        
                        //                Button
                        NormalButton(onTap: {
                            Task{
                                do{
                                    try await viewModel.signUp()
                                    showMainAuthView = false
                                }catch{
                                    print(error)
                                }
                            }
                        }, title: "Sign Up")
                        .padding(.top,ProjectPaddings.Top.normal.rawValue)
                    Spacer()
                }
                    .padding()
                
            }.ignoresSafeArea()
            }
        }
    }
    
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpView(showMainAuthView: .constant(false)).ignoresSafeArea()
        }
    }

