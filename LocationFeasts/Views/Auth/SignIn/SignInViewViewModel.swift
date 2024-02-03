//
//  SignInViewViewModifier.swift
//  Walletly
//
//  Created by Gokhan Kaya on 5.10.2023.
//

import Foundation
import FirebaseAuth


final class SignInViewViewModel : ObservableObject{
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var isExist : Bool = false
    
    
    func signIn() async throws{
        guard !email.isEmpty,!password.isEmpty else{
            print("No email and password")
            return
        }
        let authDataResultModel = try await AuthManager.shared.signIn(email: email, password: password)
        isExist = true
    }
    
   
}
