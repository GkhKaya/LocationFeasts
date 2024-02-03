//
//  RecoverPasswordViewViewModel.swift
//  Walletly
//
//  Created by Gokhan Kaya on 10.10.2023.
//

import Foundation

final class RecoverPasswordViewViewModel : ObservableObject{
    @Published var email = ""
    
    func recoverPassword() async throws{
        let authedUser = try AuthManager.shared.getAuthenticatedUser()
        guard let email = authedUser.email else{
            throw URLError(.fileDoesNotExist)
        }
        try await AuthManager.shared.recoverPassword(email: email)
    }
    
}
