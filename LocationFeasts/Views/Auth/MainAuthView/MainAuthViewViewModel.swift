//
//  MainAuthViewViewController.swift
//  Walletly
//
//  Created by Gokhan Kaya on 25.10.2023.
//

import Foundation
import FirebaseAuth


final class MainAuthViewViewModel :ObservableObject {
    
    @Published var goToSignInView  :Bool = false
    let signInAppleHelper = SignInWithAppleHelper()
    
    func googleSignIn() async throws{
        let helper  = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        let authDataResultModel = try await AuthManager.shared.signInWithGoogle(tokens: tokens)
        let user = DBUserModel(auth: authDataResultModel)
        try await UserManager.shered.crateNewUser(user: user)
        
    }
    
    func appleSignIn() async throws{
        let helper  =  SignInWithAppleHelper()
        let tokens = try await helper.startSignInWithAppleFlow()
        let authDataResultModel = try await AuthManager.shared.signInWithApple(tokens:tokens)
        let user = DBUserModel(auth: authDataResultModel)
        try await UserManager.shered.crateNewUser(user: user)

    }
}


 
